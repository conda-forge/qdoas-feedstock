#!/bin/bash
set -e
set -x


if [[ "$build_platform" != "$target_platform" ]]; then
    # This flag is used in conjunction with QT_FORCE_BUILD_TOOLS=ON
    # https://github.com/qt/qtbase/commit/acfbe3b7795c741b269fc23ed2c51c5937cd7f4f
    export QT_HOST_PATH="$BUILD_PREFIX"
    CMAKE_ARGS="${CMAKE_ARGS} -DQT_FORCE_BUILD_TOOLS=ON"
fi

mkdir build
cd build

cmake $CMAKE_ARGS \
  -DCMAKE_BUILD_TYPE="Release" \
  -DCMAKE_INSTALL_PREFIX="$PREFIX" \
  -DCONDA_INCLUDE_DIR="$PREFIX/include" \
  -DCMAKE_CXX_FLAGS="-D_LIBCPP_DISABLE_AVAILABILITY -Wno-deprecated-declarations" \
  ..

make -j$CPU_COUNT
