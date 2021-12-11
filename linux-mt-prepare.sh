#!/bin/bash
# Stuff to turn a stock arch config into what i want.
sed -i "s/CONFIG_HZ=300/CONFIG_HZ=1000/g" config
sed -i "s/CONFIG_HZ_300=y/# CONFIG_HZ_300 is not set/g" config
sed -i "s/CONFIG_NO_HZ_IDLE=y/# CONFIG_NO_HZ_IDLE is not set/g" config
sed -i "s/# CONFIG_NO_HZ_FULL is not set/CONFIG_NO_HZ_FULL=y/g" config
sed -i "s/# CONFIG_ANDROID is not set/CONFIG_ANDROID=y/g" config
echo "CONFIG_ANDROID_BINDER_IPC=y" >> config
echo 'CONFIG_ANDROID_BINDER_DEVICES="binder,hwbinder,vndbinder"' >> config
echo "CONFIG_ANDROID_BINDERFS=n" >> config
echo "CONFIG_ANDROID_BINDER_IPC_SELFTEST=n" >> config
echo "CONFIG_ASHMEM=y" >> config
