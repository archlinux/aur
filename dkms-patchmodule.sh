#!/bin/bash

DRIVER_PATH=$1

kernel_version=$(cat /proc/version | cut -d " " -f 3)
vers=${kernel_version//-/ }
vers=${vers//./ }
vers=($vers)
major="${vers[0]}"
minor="${vers[1]}"
subver="${vers[2]}"
version="$major.$minor.$subver"

kernel_source_file="linux-${version}.tar.xz"

cf_ns_trace=$(curl -s https://cf-ns.com/cdn-cgi/trace)
KERNEL_SOURCE="https://mirrors.edge.kernel.org/pub/linux/kernel/v$major.x/$kernel_source_file"
if [[ "$cf_ns_trace" == *"loc=CN"* ]]; then
  KERNEL_SOURCE="https://mirrors.ustc.edu.cn/kernel.org/linux/kernel/v$major.x/$kernel_source_file"
fi

if [ ! -f "${kernel_source_file}" ]; then
	echo "Downloading kernel source from $KERNEL_SOURCE"
	curl -sS $KERNEL_SOURCE -o $kernel_source_file
fi

echo "Extracting kernel source"
bsdtar -xvf $kernel_source_file linux-${version}/$DRIVER_PATH

for i in $(ls *.patch); do
    echo "Applying patch $i"
    patch -Np1 -d linux-${version}/ <$i
done

echo "Reorganizing sources"
mv linux-${version}/$DRIVER_PATH/* ./

echo "Cleaning up"
rm -rf ./linux-${version}
