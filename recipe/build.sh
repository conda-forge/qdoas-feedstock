#!/bin/bash
set -e
set -x

mkdir build
cd build

cmake $CMAKE_ARGS \
  -DCMAKE_BUILD_TYPE="Release" \
  -DCMAKE_INSTALL_PREFIX="$PREFIX" \
  -DCONDA_INCLUDE_DIR="$PREFIX/include" \
  -DCMAKE_CXX_FLAGS="-D_LIBCPP_DISABLE_AVAILABILITY -Wno-deprecated-declarations" \
  ..

make -j$CPU_COUNT
