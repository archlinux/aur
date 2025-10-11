# Maintainer: vnctdj
# Contributor: Jonathon Fernyhough (RIP) <jonathon+m2x+dev>
# Contributor: Alonso Rodriguez <alonsorodi20 (at) gmail (dot) com>
# Contributor: Sven-Hendrik Haase <svenstaro@gmail.com>
# Contributor: Thomas Baechler <thomas@archlinux.org>
# Contributor: James Rayner <iphitus@gmail.com>

pkgbase=nvidia-390xx-utils
pkgname=('nvidia-390xx-utils' 'opencl-nvidia-390xx' 'nvidia-390xx-dkms')
pkgver=390.157
pkgrel=18
arch=('x86_64')
url="https://www.nvidia.com/"
license=('custom')
options=('!strip')
_pkg="NVIDIA-Linux-x86_64-${pkgver}"
source=('nvidia-drm-outputclass.conf'
        'nvidia-390xx-utils.sysusers'
        'nvidia-390xx.rules'
        'systemd-homed-override.conf'
        'systemd-suspend-override.conf'
        "https://us.download.nvidia.com/XFree86/Linux-x86_64/${pkgver}/${_pkg}.run"
        kernel-6.2.patch
        kernel-6.3.patch
        kernel-6.4.patch
        kernel-6.5.patch
        kernel-6.6.patch
        kernel-6.8.patch
        gcc-14.patch
        kernel-6.10.patch
        kernel-6.12.patch
        kernel-6.13.patch
        kernel-6.14.patch
        gcc-15.patch
        kernel-6.15.patch
        kernel-6.17.patch
        kernel-4.16+-memory-encryption.patch)
b2sums=('8e24aea70b139185bd682b080d32aeda673e6e92b45a90e6f6e0d736674180400bc8bd1aa5c66b8d033fc9d5e0cfffed456a87298bd93a3afbbc30b8dc48c4e9'
        'c1da4ce5784e43385465913a95053a3e54f800aac6f1b49f33e2a77504d76da5e6db6ec7074fbe7ba5f52dcef9e1ebaa620942c33ff825a56caba5c9c8b0d1be'
        '67e32932eeddda8fef667d25c34faf7b3a02f01cf9c15a97e5613bd44a0e8dcf7396e25399a52701f55dd18054c689720f237bb07d5bd580394d8dc8c9d05534'
        'a797a5bca65281ba35ed535f625dd997e649b91064226b59f3288c833f2f358fd3dea32674e0f5968de1eb025e4872e4b8b7883c5dfdb1f7116257ddfae4fe22'
        'b8ada501cc9a88d440d91efaeddb52b4bba7582d2dbc6fdefcf109a8a8a2a030070aa8567569eacaa30b1bb9447c0a90b4907a9bba850bed4a4ad284c6f0f575'
        '44b855cd11f3b2f231f9fb90492ae2e67a67ea3ea83c413e7c90956d38c9730a8bd0321281ae03c6afce633d102f5b499aed25622b9bfd31bdd2c98f0717e95b'
        'dd1153903badbb9c2401c583a983ce5a413da2afffa6dd3ef6e839933a1c994518d5bfbcaf6800496e0d40785a4e7eb0770c8a739fe231ad3085c541bcb3f2b2'
        '09f674b2bd55d40df072b70598b78d6a4e57f80a974f99d39b9cd95e0e20cd5698b9b48671b5cb85fcda780d4badc84c8caa5104d2a5c5f85b37841109101701'
        'f9ee14546802eb180a650d91cbf7bcaa046afe80a4ac07624a6d2c186db956d9b055c21dd05987b5ad39be205255142c11f73d39fe6f9c7a3d9553f8ac8ad221'
        '0d4101e8d55b853613ddf53a4f258beda23c89bb2beb2cede6be7ecb1a35be1a81604363e2367d06e6bcd64ba4424eb7d2766c6468ebb9bb75d06ac2b40edbeb'
        '1b0156a4fe7eddcfa549dbb56f892c181fd86ef5897bbf4f81ed1ea68f7bff6e77602083bd2792fc57f790b35a8020c0879695b1e6b1be02d3233fb6f781dc4a'
        'd7059792166bd0d1fce8f494d869b13e95aefd31af8d626651f5087e87f9c728655d1fbffbc8b6c2e1ee5d9e96f2a3fafadf7a3e06c28bdbfd266319c32c7704'
        '2382cc3e1ce89931cc5943fa1e96094f592915bd64bc88ff9b087e0c127347b440dd969cce149c01ee894f1ec9c059c616eee6f20cd4af2ba2c81fbd690e498b'
        'a06b47d59e11ab2f8bd7af97042a3ed15ac97559b3c507a03fa453481b86727d98f8a34e95c6fc38fe82f803d0b67282dba4f27d4f714d2c68eb2eb0ce98e575'
        'aaa0597ab9d33be3c6e020fab0d54890d32f32c5ce70571e2bc989a788dbe2317e826475966bc1026bf7f7ff6672bd9a2f7f8e48dcebd2f91d33d9181eee1208'
        '8e5502a6668bf3981d1e9cc6cdad428fcfdd221b51850b0fde74d631faa379d965b97a87e845eda2bc0e99a0aa9bf58642444bdea9f976cafcd12edf0e20f5db'
        '21b87918e9b9b0475ab4fb548be6daadd6921566fb03a3f96cffff5296f9fa1bccdabe7c4671aba2a1dc455248b7a96e5a088c48ab922305213bc714e4a39d6c'
        'a957b5d3afb60d4879c5e25bf4b947a670048e23559864f5bced6b9ab4f79e3f9c62ad7fad52def372fa2dbe4df70410d205aa4386021e1f4db476b02836fcc5'
        '68345d8fb2ea00bd7042fe6cf1c8e63c8f9be411a710eb4f40734ca109f278466d9de1f4b3a2676767b7c16d179ce9b382ebe49c181d081f157304d220d69b12'
        'efaed80af94533496ea77293ce48e383d836559316b8a2c9dd36a73c5ea3170f8ee61ec9a4151db13e4a28a167d3b9d7773baad9c082596e8f043de92b4c1932'
        'a8234f542c2324ad698443e3decf7b6eacf3cb420b7aded787f102a8d32b64c2a8d45ea58e37a5e3b6f2f060f0cccd63d3a182065f57c606006d0ff8c7f6bb05')

create_links() {
    # create soname links
    find "$pkgdir" -type f -name '*.so*' ! -path '*xorg/*' -print0 | while read -d $'\0' _lib; do
        _soname=$(dirname "${_lib}")/$(readelf -d "${_lib}" | grep -Po 'SONAME.*: \[\K[^]]*' || true)
        _base=$(echo ${_soname} | sed -r 's/(.*)\.so.*/\1.so/')
        [[ -e "${_soname}" ]] || ln -s $(basename "${_lib}") "${_soname}"
        [[ -e "${_base}" ]] || ln -s $(basename "${_soname}") "${_base}"
    done
}

prepare() {
    sh "${_pkg}.run" --extract-only
    cd "${_pkg}"
    bsdtar -xf nvidia-persistenced-init.tar.bz2

    sed -i 's/__NV_VK_ICD__/libGLX_nvidia.so.0/' nvidia_icd.json.template

    # Restore phys_to_dma support (still needed for 390.138)
    # From loqs via https://bugs.archlinux.org/task/58074
    patch -Np1 -i ../kernel-4.16+-memory-encryption.patch

    # From Joan Bruguera via Ike Devolder
    patch -Np1 -i ../kernel-6.2.patch

    # From Ike Devolder
    patch -Np1 -i ../kernel-6.3.patch

    # From Joan Bruguera via duht
    patch -Np1 -i ../kernel-6.4.patch

    # From Joan Bruguera via Witscher
    patch -Np1 -i ../kernel-6.5.patch

    # From canolucas
    patch -Np1 -i ../kernel-6.6.patch

    # From Joan Bruguera
    patch -Np1 -i ../kernel-6.8.patch

    # From loqs
    patch -Np1 -i ../gcc-14.patch

    # From Ike Devolder, edited by drankinatty
    patch -Np1 -i ../kernel-6.10.patch

    # From Joan Bruguera (https://gist.github.com/joanbm/a6d3f7f873a60dec0aa4a734c0f1d64e), edited by drankinatty
    patch -Np1 -i ../kernel-6.12.patch

    # From Joan Bruguera (https://gist.github.com/joanbm/d1f89391a4b20f4b56ba931ef6ca62da)
    patch -Np1 -i ../kernel-6.13.patch

    # From Joan Bruguera (https://gist.github.com/joanbm/d0cb8790ca610fbd2c2e43f30707ce18)
    patch -Np1 -i ../kernel-6.14.patch

    # From bufferunderrun
    patch -Np1 -i ../gcc-15.patch

    # From Joan Bruguera (https://gist.github.com/joanbm/def2bf57ed7a799c1d84a67606459314), edited by drankinatty
    patch -Np1 -i ../kernel-6.15.patch

    # From Joan Bruguera (https://github.com/joanbm/nvidia-470xx-linux-mainline/blob/master/patches/nvidia-470xx-fix-linux-6.17.patch)
    patch -Np1 -i ../kernel-6.17.patch

    cd kernel

    sed -i "s/__VERSION_STRING/${pkgver}/" dkms.conf
    sed -i 's/__JOBS/`nproc`/' dkms.conf
    sed -i 's/__DKMS_MODULES//' dkms.conf
    sed -i '$iBUILT_MODULE_NAME[0]="nvidia"\
DEST_MODULE_LOCATION[0]="/kernel/drivers/video"\
BUILT_MODULE_NAME[1]="nvidia-uvm"\
DEST_MODULE_LOCATION[1]="/kernel/drivers/video"\
BUILT_MODULE_NAME[2]="nvidia-modeset"\
DEST_MODULE_LOCATION[2]="/kernel/drivers/video"\
BUILT_MODULE_NAME[3]="nvidia-drm"\
DEST_MODULE_LOCATION[3]="/kernel/drivers/video"' dkms.conf

    # Gift for linux-rt guys
    sed -i 's/NV_EXCLUDE_BUILD_MODULES/IGNORE_PREEMPT_RT_PRESENCE=1 NV_EXCLUDE_BUILD_MODULES/' dkms.conf
}

package_opencl-nvidia-390xx() {
    pkgdesc="OpenCL implemention for NVIDIA"
    depends=('zlib')
    optdepends=('opencl-headers: headers necessary for OpenCL development')
    provides=('opencl-driver' 'opencl-nvidia')
    conflicts=('opencl-nvidia')
    cd "${_pkg}"

    # OpenCL
    install -Dm644 nvidia.icd "${pkgdir}/etc/OpenCL/vendors/nvidia.icd"
    install -Dm755 "libnvidia-compiler.so.${pkgver}" "${pkgdir}/usr/lib/libnvidia-compiler.so.${pkgver}"
    install -Dm755 "libnvidia-opencl.so.${pkgver}" "${pkgdir}/usr/lib/libnvidia-opencl.so.${pkgver}"

    create_links

    mkdir -p "${pkgdir}/usr/share/licenses"
    ln -s nvidia-utils "${pkgdir}/usr/share/licenses/opencl-nvidia"
}

package_nvidia-390xx-dkms() {
    pkgdesc="NVIDIA drivers - module sources"
    depends=('dkms' "nvidia-390xx-utils=$pkgver" 'libglvnd')
    provides=('NVIDIA-MODULE')

    cd ${_pkg}

    install -dm 755 "${pkgdir}"/usr/src
    cp -dr --no-preserve='ownership' kernel "${pkgdir}/usr/src/nvidia-${pkgver}"

    install -Dt "${pkgdir}/usr/share/licenses/${pkgname}" -m644 "${srcdir}/${_pkg}/LICENSE"
}

package_nvidia-390xx-utils() {
    pkgdesc="NVIDIA drivers utilities"
    depends=('xorg-server' 'libglvnd' 'egl-wayland')
    optdepends=('nvidia-390xx-settings: configuration tool'
                'xorg-server-devel: nvidia-xconfig'
                'opencl-nvidia-390xx: OpenCL support')
    conflicts=('nvidia-libgl' 'nvidia-utils' 'nvidia-390xx-libgl')
    provides=('vulkan-driver' 'opengl-driver' 'nvidia-libgl' 'nvidia-utils' 'nvidia-390xx-libgl')
    install="${pkgname}.install"

    cd "${_pkg}"

    # Check http://us.download.nvidia.com/XFree86/Linux-x86_64/${pkgver}/README/installedcomponents.html
    # for hints on what needs to be installed where.

    # X driver
    install -Dm755 nvidia_drv.so "${pkgdir}/usr/lib/xorg/modules/drivers/nvidia_drv.so"

    # GLX extension module for X
    install -Dm755 "libglx.so.${pkgver}" "${pkgdir}/usr/lib/nvidia/xorg/libglx.so.${pkgver}"
    # Ensure that X finds glx
    ln -s "libglx.so.${pkgver}" "${pkgdir}/usr/lib/nvidia/xorg/libglx.so.1"
    ln -s "libglx.so.${pkgver}" "${pkgdir}/usr/lib/nvidia/xorg/libglx.so"

    install -Dm755 "libGLX_nvidia.so.${pkgver}" "${pkgdir}/usr/lib/libGLX_nvidia.so.${pkgver}"

    # OpenGL libraries
    install -Dm755 "libEGL_nvidia.so.${pkgver}" "${pkgdir}/usr/lib/libEGL_nvidia.so.${pkgver}"
    install -Dm755 "libGLESv1_CM_nvidia.so.${pkgver}" "${pkgdir}/usr/lib/libGLESv1_CM_nvidia.so.${pkgver}"
    install -Dm755 "libGLESv2_nvidia.so.${pkgver}" "${pkgdir}/usr/lib/libGLESv2_nvidia.so.${pkgver}"
    install -Dm644 "10_nvidia.json" "${pkgdir}/usr/share/glvnd/egl_vendor.d/10_nvidia.json"

    # OpenGL core library
    install -Dm755 "libnvidia-glcore.so.${pkgver}" "${pkgdir}/usr/lib/libnvidia-glcore.so.${pkgver}"
    install -Dm755 "libnvidia-eglcore.so.${pkgver}" "${pkgdir}/usr/lib/libnvidia-eglcore.so.${pkgver}"
    install -Dm755 "libnvidia-glsi.so.${pkgver}" "${pkgdir}/usr/lib/libnvidia-glsi.so.${pkgver}"

    # misc
    install -Dm755 "libnvidia-ifr.so.${pkgver}" "${pkgdir}/usr/lib/libnvidia-ifr.so.${pkgver}"
    install -Dm755 "libnvidia-fbc.so.${pkgver}" "${pkgdir}/usr/lib/libnvidia-fbc.so.${pkgver}"
    install -Dm755 "libnvidia-encode.so.${pkgver}" "${pkgdir}/usr/lib/libnvidia-encode.so.${pkgver}"
    install -Dm755 "libnvidia-cfg.so.${pkgver}" "${pkgdir}/usr/lib/libnvidia-cfg.so.${pkgver}"
    install -Dm755 "libnvidia-ml.so.${pkgver}" "${pkgdir}/usr/lib/libnvidia-ml.so.${pkgver}"

    # Vulkan ICD
    install -Dm644 "nvidia_icd.json.template" "${pkgdir}/usr/share/vulkan/icd.d/nvidia_icd.json"

    # VDPAU
    install -Dm755 "libvdpau_nvidia.so.${pkgver}" "${pkgdir}/usr/lib/vdpau/libvdpau_nvidia.so.${pkgver}"

    # nvidia-tls library
    install -Dm755 "tls/libnvidia-tls.so.${pkgver}" "${pkgdir}/usr/lib/libnvidia-tls.so.${pkgver}"

    # CUDA
    install -Dm755 "libcuda.so.${pkgver}" "${pkgdir}/usr/lib/libcuda.so.${pkgver}"
    install -Dm755 "libnvcuvid.so.${pkgver}" "${pkgdir}/usr/lib/libnvcuvid.so.${pkgver}"

    # PTX JIT Compiler (Parallel Thread Execution (PTX) is a pseudo-assembly language for CUDA)
    install -Dm755 "libnvidia-ptxjitcompiler.so.${pkgver}" "${pkgdir}/usr/lib/libnvidia-ptxjitcompiler.so.${pkgver}"

    # Fat (multiarchitecture) binary loader
    install -Dm755 "libnvidia-fatbinaryloader.so.${pkgver}" "${pkgdir}/usr/lib/libnvidia-fatbinaryloader.so.${pkgver}"

    # DEBUG
    install -Dm755 nvidia-debugdump "${pkgdir}/usr/bin/nvidia-debugdump"

    # nvidia-xconfig
    install -Dm755 nvidia-xconfig "${pkgdir}/usr/bin/nvidia-xconfig"
    install -Dm644 nvidia-xconfig.1.gz "${pkgdir}/usr/share/man/man1/nvidia-xconfig.1.gz"

    # nvidia-bug-report
    install -Dm755 nvidia-bug-report.sh "${pkgdir}/usr/bin/nvidia-bug-report.sh"

    # nvidia-smi
    install -Dm755 nvidia-smi "${pkgdir}/usr/bin/nvidia-smi"
    install -Dm644 nvidia-smi.1.gz "${pkgdir}/usr/share/man/man1/nvidia-smi.1.gz"

    # nvidia-cuda-mps
    install -Dm755 nvidia-cuda-mps-server "${pkgdir}/usr/bin/nvidia-cuda-mps-server"
    install -Dm755 nvidia-cuda-mps-control "${pkgdir}/usr/bin/nvidia-cuda-mps-control"
    install -Dm644 nvidia-cuda-mps-control.1.gz "${pkgdir}/usr/share/man/man1/nvidia-cuda-mps-control.1.gz"

    # nvidia-modprobe
    # This should be removed if nvidia fixed their uvm module!
    install -Dm4755 nvidia-modprobe "${pkgdir}/usr/bin/nvidia-modprobe"
    install -Dm644 nvidia-modprobe.1.gz "${pkgdir}/usr/share/man/man1/nvidia-modprobe.1.gz"

    # nvidia-persistenced
    install -Dm755 nvidia-persistenced "${pkgdir}/usr/bin/nvidia-persistenced"
    install -Dm644 nvidia-persistenced.1.gz "${pkgdir}/usr/share/man/man1/nvidia-persistenced.1.gz"
    install -Dm644 nvidia-persistenced-init/systemd/nvidia-persistenced.service.template "${pkgdir}/usr/lib/systemd/system/nvidia-persistenced.service"
    sed -i 's/__USER__/nvidia-persistenced/' "${pkgdir}/usr/lib/systemd/system/nvidia-persistenced.service"

    # application profiles
    install -Dm644 nvidia-application-profiles-${pkgver}-rc "${pkgdir}/usr/share/nvidia/nvidia-application-profiles-${pkgver}-rc"
    install -Dm644 nvidia-application-profiles-${pkgver}-key-documentation "${pkgdir}/usr/share/nvidia/nvidia-application-profiles-${pkgver}-key-documentation"

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/nvidia-utils/LICENSE"
    install -Dm644 README.txt "${pkgdir}/usr/share/doc/nvidia/README"
    install -Dm644 NVIDIA_Changelog "${pkgdir}/usr/share/doc/nvidia/NVIDIA_Changelog"
    cp -r html "${pkgdir}/usr/share/doc/nvidia/"
    ln -s nvidia "${pkgdir}/usr/share/doc/nvidia-utils"

    # distro specific files must be installed in /usr/share/X11/xorg.conf.d
    install -Dm644 "${srcdir}/nvidia-drm-outputclass.conf" "${pkgdir}/usr/share/X11/xorg.conf.d/10-nvidia-drm-outputclass.conf"

    install -Dm644 "${srcdir}/nvidia-390xx-utils.sysusers" "${pkgdir}/usr/lib/sysusers.d/$pkgname.conf"

    install -Dm644 "${srcdir}/nvidia-390xx.rules" "$pkgdir"/usr/lib/udev/rules.d/60-nvidia-390xx.rules

    # Fix for system freeze upon systemctl suspend/hibernate since systemd v256
    install -Dm644 "${srcdir}"/systemd-homed-override.conf "${pkgdir}"/usr/lib/systemd/system/systemd-homed.service.d/10-nvidia-no-freeze-session.conf
    install -Dm644 "${srcdir}"/systemd-suspend-override.conf "${pkgdir}"/usr/lib/systemd/system/systemd-suspend.service.d/10-nvidia-no-freeze-session.conf
    install -Dm644 "${srcdir}"/systemd-suspend-override.conf "${pkgdir}"/usr/lib/systemd/system/systemd-suspend-then-hibernate.service.d/10-nvidia-no-freeze-session.conf
    install -Dm644 "${srcdir}"/systemd-suspend-override.conf "${pkgdir}"/usr/lib/systemd/system/systemd-hibernate.service.d/10-nvidia-no-freeze-session.conf
    install -Dm644 "${srcdir}"/systemd-suspend-override.conf "${pkgdir}"/usr/lib/systemd/system/systemd-hybrid-sleep.service.d/10-nvidia-no-freeze-session.conf

    echo "blacklist nouveau" | install -Dm644 /dev/stdin "${pkgdir}/usr/lib/modprobe.d/${pkgname}.conf"
    echo "nvidia-uvm" | install -Dm644 /dev/stdin "${pkgdir}/usr/lib/modules-load.d/${pkgname}.conf"

    create_links
}
