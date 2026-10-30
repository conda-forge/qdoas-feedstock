#!/bin/bash
set -e
set -x

cd build

if [[ "${PKG_NAME}" == "doas_cl" ]]; then
    cmake --install . --component doas_cl
elif [[ "${PKG_NAME}" == "qdoas" ]]; then
    cmake --install . --component gui-tools
    if [[ "${target_platform}" == osx-* ]]; then
        codesign --force --options runtime --sign - "${PREFIX}/qdoas.app/Contents/MacOS/ring"
        codesign --force --options runtime --sign - "${PREFIX}/qdoas.app/Contents/MacOS/convolution"
        codesign --force --options runtime --sign - "${PREFIX}/qdoas.app/Contents/MacOS/usamp"
        codesign --force --options runtime --sign - "${PREFIX}/qdoas.app/Contents/MacOS/qdoas"
        codesign --force --options runtime --sign - "${PREFIX}/qdoas.app"
    fi
fi
