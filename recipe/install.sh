#!/bin/bash
set -e
set -x

cd build

if [[ "${PKG_NAME}" == "doas_cl" ]]; then
    cmake --install . --component doas_cl
elif [[ "${PKG_NAME}" == "qdoas" ]]; then
    cmake --install . --component gui-tools
fi
