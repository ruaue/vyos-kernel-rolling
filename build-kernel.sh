#!/bin/sh
CWD=$(pwd)
KERNEL_SRC=linux

if [ ! -d ${KERNEL_SRC} ]; then
    echo "Linux Kernel source directory does not exists, please 'git clone'"
    exit 1
fi

cd ${KERNEL_SRC}


# VyOS requires some small Kernel Patches - apply them here
# It's easier to habe them here and make use of the upstream
# repository instead of maintaining a full Kernel Fork.
# Saving time/resources is essential :-)
PATCH_DIR=${CWD}/patches/kernel
for patch in $(ls ${PATCH_DIR})
do
    echo "I: Apply Kernel patch: ${PATCH_DIR}/${patch}"
    patch -p1 < ${PATCH_DIR}/${patch}
done

