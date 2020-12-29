#!/bin/bash
set -e

CTCDECODE_VERSION=$1
if [[ -z "$CTCDECODE_VERSION" ]] ; then
    echo "CTCDECODE_VERSION not set."
    exit 1
fi
echo "CTCDECODE_VERSION=$CTCDECODE_VERSION"

DIST_FOLDER=$2
if [[ -z "$DIST_FOLDER" ]] ; then
    echo "DIST_FOLDER not set."
    exit 1
fi
echo "DIST_FOLDER=$DIST_FOLDER"
mkdir -p $DIST_FOLDER

# Download source code.
git clone \
    --depth 1 \
    --branch "$CTCDECODE_VERSION" \
    https://github.com/parlance/ctcdecode.git \
    "${DIST_FOLDER}/ctcdecode"

# Build wheel.
cd "${DIST_FOLDER}/ctcdecode"
python setup.py bdist_wheel

ls dist
