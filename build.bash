#!/bin/bash -e

if [[ -d kernel-source ]]; then
    rm -rf kernel-source
fi

kernelver=$1
if [[ -z ${kernelver} ]]; then
    echo "Usage: $0 <kernel version>"
    exit 1
fi
KERNEL_VERSION=$(echo ${kernelver} | cut -d- -f1)
KERNEL_PATCH=$(echo ${kernelver} | cut -d- -f2)
KBASE=`pwd`

if [[ ${KERNEL_PATCH:0:4} == "arch" ]]; then
    SRC_URL="https://github.com/archlinux/linux/archive/v${KERNEL_VERSION}-${KERNEL_PATCH}.tar.gz"
    SRC_DIR="linux-${KERNEL_VERSION}-${KERNEL_PATCH}"
elif [[ ${KERNEL_PATCH:0:3} == "zen" ]]; then
    SRC_URL="https://github.com/zen-kernel/zen-kernel/archive/v${KERNEL_VERSION}-${KERNEL_PATCH}.tar.gz"
    SRC_DIR="zen-kernel-${KERNEL_VERSION}-${KERNEL_PATCH}"
else
    echo "Unsupported kernel version: ${KERNEL_VERSION}-${KERNEL_PATCH}"
    exit 1
fi

if [[ ! -f v${KERNEL_VERSION}-${KERNEL_PATCH}.tar.gz ]]; then
    # Download kernel source
    echo "Downloading kernel source from ${SRC_URL}"
    wget ${SRC_URL}
fi

# Extract kernel source
echo "Extracting kernel source to ${SRC_DIR}"
tar -xf v${KERNEL_VERSION}-${KERNEL_PATCH}.tar.gz

mv ${SRC_DIR} kernel-source
SRC_DIR=${KBASE}/kernel-source

# Apply patches
echo "Applying patches"
cd ${SRC_DIR}
patch -p1 -i ${KBASE}/patches/arch.patch

# Build kernel modules
echo "Building kernel modules"
cp /usr/lib/modules/${kernelver}/build/.config .
cp /usr/lib/modules/${kernelver}/build/Module.symvers .
make scripts oldconfig modules_prepare

# Compile UVC modules
echo "Build uvcvideo.ko"
cd drivers/media/usb/uvc
cp ${SRC_DIR}/Module.symvers .
make -C ${SRC_DIR} M=${SRC_DIR}/drivers/media/usb/uvc/ uvcvideo.ko
cp uvcvideo.ko ${KBASE}/uvcvideo.ko

# Compile v4l2-core
echo "Build videodev.ko"
cd ${SRC_DIR}/drivers/media/v4l2-core
cp ${SRC_DIR}/Module.symvers .
make -C ${SRC_DIR} M=${SRC_DIR}/drivers/media/v4l2-core/ videodev.ko
cp videodev.ko ${KBASE}/videodev.ko

# # Compile accelerometer
# echo "Build hid-sensor-accel-3d.ko"
# cd ${SRC_DIR}/drivers/iio/accel
# cp ${SRC_DIR}/Module.symvers .
# make -C ${SRC_DIR} M=${SRC_DIR}/drivers/iio/accel/ hid-sensor-accel-3d.ko
# cp hid-sensor-accel-3d.ko ${KBASE}/hid-sensor-accel-3d.ko

# # Compile gyro
# echo "Build hid-sensor-gyro-3d.ko"
# cd ${SRC_DIR}/drivers/iio/gyro
# cp ${SRC_DIR}/Module.symvers .
# make -C ${SRC_DIR} M=${SRC_DIR}/drivers/iio/gyro/ hid-sensor-gyro-3d.ko
# cp hid-sensor-gyro-3d.ko ${KBASE}/hid-sensor-gyro-3d.ko

# Done
echo "Done"
