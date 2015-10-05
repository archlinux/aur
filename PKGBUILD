# Contributors:
#   Tobias Powalowski <tpowa@archlinux.org>
#   Thomas Baechler <thomas@archlinux.org>

_localmodcfg=
_disable_NUMA=y
_use_1_kHz_ticks=y
_enable_BFQ=

pkgname=(linux-lts314-ck linux-lts314-ck-headers)
pkgver=3.14.54
pkgrel=1
arch=('i686' 'x86_64')
url="https://www.kernel.org/"
license=('GPL2')
makedepends=('kmod' 'inetutils' 'bc')
options=('!strip')
source=("https://www.kernel.org/pub/linux/kernel/v3.x/linux-3.14.54.tar.xz"
        "https://www.kernel.org/pub/linux/kernel/v3.x/linux-3.14.54.tar.sign"
        "https://www.kernel.org/pub/linux/kernel/v3.x/patch-3.14.54.xz"
        "https://www.kernel.org/pub/linux/kernel/v3.x/patch-3.14.54.sign"
        "http://ck.kolivas.org/patches/3.0/3.14/3.14-ck1/patch-3.14-ck1.bz2"
        "http://repo-ck.com/source/gcc_patch/enable_additional_cpu_optimizations_for_gcc_v4.9+.patch.gz"
        "linux-lts314-ck.preset"
        "change-default-console-loglevel.patch"
        "0001-Bluetooth-allocate-static-minor-for-vhci.patch"
        "0002-module-allow-multiple-calls-to-MODULE_DEVICE_TABLE-p.patch"
        "0003-module-remove-MODULE_GENERIC_TABLE.patch"
        "0006-genksyms-fix-typeof-handling.patch"
        "config"
        "config.x86_64"
        "http://algo.ing.unimo.it/people/paolo/disk_sched/patches/3.14.0-v7r8/0001-block-cgroups-kconfig-build-bits-for-BFQ-v7r8-3.14.patch"
        "http://algo.ing.unimo.it/people/paolo/disk_sched/patches/3.14.0-v7r8/0002-block-introduce-the-BFQ-v7r8-I-O-sched-for-3.14.patch"
        "http://algo.ing.unimo.it/people/paolo/disk_sched/patches/3.14.0-v7r8/0003-block-bfq-add-Early-Queue-Merge-EQM-to-BFQ-v7r8-for-3.14.0.patch")

sha512sums=("6567aaced92c30cf9bcda0334c22a7f67dbd6e517421282a4ed3aeaaf9a6dcf82cdf9359b93b9c9f050b3006c3e0a4cde1dc92335ceed5ff4031d76e7c620f1f"
            "SKIP"
            "36874d66d0a028f0c9ce8eeefdba9a9c0a09286a49a83001743505af1a9fcf21429b3dfb5a5b66ddfc98dfe6d27b780e8ddbfaa0580bd7bb7683f08cb9f95521"
            "SKIP"
            "d745370376e660245e0a5cc4512f0c584a4c782ddb0747637d6ec60021d95afa09d5728f44756c48843b398ba3072823bea99b1713c0833c941a522da0b6f305"
            "1b8ac77604b891aac57257bc3d9578596f38f2f75a625310a7d36e7f59612a616da6ef12d028622cb855a065e4fadc739cb67d12370c49bb52708744ad312957"
            "57545d604cdb14b3c1b6dc99267216cb21f11451d2abd2d18fb1243a3dc891e5df8dd14a52c3c07b2c28efaf1ccd23ea6c08a2fa1fdaed746614e2346e1e484a"
            "502192b5ce94c8254205f5ddb85bf50c5f1e78c768817b10dca3a7716a8c59d5e093842631acb51e3805cbf85522e0a9200942656f11bbb4ea1b7d61e24ddd78"
            "f26306c173e3fc35ae6df4c43e9ddbac33845dcc1fb0def612fe370c2d7b8f904b4c70d267eb52717ade879d1e289695b9e971dfcb1c963dac4c6e2fb5230453"
            "da69065f317212c7937f5c3110afdef6006da7756b0a2a98c4bff94db12eb503dc89040aa3cd7a1655ba1b0641f47dda4e60933309e231eaecbe9bd79cb06ebd"
            "4b9fa6afdd1f4f4f6a3a439380cff3376ef33e782aac0ae92421f4b7c40140d57a04d7bc57dfd9fb59fdefb3a0a55fe7e7d6022314b11ef454a1cae4b75cf264"
            "fdb67e9956d9af1518d0198b86b13150b28f43dd28eb52222a9c43699f7304cd1a56d7f421a0690fa4c0d2c266fd5504da9d6217f83a42d05f35b713fd85e2dd"
            "47fe0cefb2fb446587c4d1cd36fa0a210745da39dc5fbc36bb4061f16591f7f53d994f469f1f582082315347fb57015f8d0c066aa9a0673852e8f3bbd0393ed1"
            "8a9726cf4b33d30b8413ce8cd69a1cae6367dc697dfd4a4f0ee8251514a0b900b0e8996353f90d32c2a2e072c50af768f76cbf40fbbd32da5d49dbc7eb981d9f"
            "edf73585f1363011ba4235919b4265713d3943e3a93996822408ee4c99403a52c81d7cbf23d261aabeefeb41d2bb9b5ad26c4c1a0c6af7e27a4e092654c8e967"
            "91340f269b2aefb4df0e9999dc3664ded7d1758a7257da1268f95ced5f549a1883127b7260657a2ee0782922e7848fb3fac4ae05d822c793ecc9f2c1be9d4b5f"
            "9b8f4c92e9e0265e77ec9ad469092d0a1f5d657ec2d6a91c4aed344bc56909acc6e115a21eb9f225fa452432bc4f69c0584e7fc38d4f72a6c711631c0a8105cd")
validpgpkeys=(
              "ABAF11C65A2970B130ABE3C479BE3E4300411886" # Linux Torvalds
              "647F28654894E3BD457199BE38DBBDC86092693E" # Greg Kroah-Hartman
             )

prepare() {
    cd "${srcdir}/linux-3.14.54"

    patch -p1 -i "${srcdir}/change-default-console-loglevel.patch"

    patch -p1 -i "${srcdir}/0001-Bluetooth-allocate-static-minor-for-vhci.patch"
    patch -p1 -i "${srcdir}/0002-module-allow-multiple-calls-to-MODULE_DEVICE_TABLE-p.patch"
    patch -p1 -i "${srcdir}/0003-module-remove-MODULE_GENERIC_TABLE.patch"
    patch -p1 -i "${srcdir}/0006-genksyms-fix-typeof-handling.patch"

    sed -i -re "s/^(.EXTRAVERSION).*$/\1 = /" "${srcdir}/patch-3.14-ck1"

    patch -p1 -i "${srcdir}/patch-3.14-ck1"

    patch -p1 -i "${srcdir}/enable_additional_cpu_optimizations_for_gcc_v4.9+.patch"

    patch -p1 -i "${srcdir}/0001-block-cgroups-kconfig-build-bits-for-BFQ-v7r8-3.14.patch"
    patch -p1 -i "${srcdir}/0002-block-introduce-the-BFQ-v7r8-I-O-sched-for-3.14.patch"
    patch -p1 -i "${srcdir}/0003-block-bfq-add-Early-Queue-Merge-EQM-to-BFQ-v7r8-for-3.14.0.patch"

    if [ "${CARCH}" = "x86_64" ]; then
        cat "${srcdir}/config.x86_64" > ./.config
    else
        cat "${srcdir}/config" > ./.config
    fi

    #make oldconfig

    if [ -n "$_use_1_kHz_ticks" ]; then
        sed -i -e 's/^CONFIG_HZ_300=y/# CONFIG_HZ_300 is not set/' \
            -i -e 's/^# CONFIG_HZ_1000 is not set/CONFIG_HZ_1000=y/' \
            -i -e 's/^CONFIG_HZ=300/CONFIG_HZ=1000/' .config
    fi

    sed -i "s|CONFIG_LOCALVERSION=.*|CONFIG_LOCALVERSION=\"-lts314-ck\"|g" ./.config
    sed -i "s|CONFIG_LOCALVERSION_AUTO=.*|CONFIG_LOCALVERSION_AUTO=n|" ./.config

    if [ -n "$_disable_NUMA" ]; then
        if [ "${CARCH}" = "x86_64" ]; then
            sed -i -e 's/CONFIG_NUMA=y/# CONFIG_NUMA is not set/' \
                -i -e '/CONFIG_AMD_NUMA=y/d' \
                -i -e '/CONFIG_X86_64_ACPI_NUMA=y/d' \
                -i -e '/CONFIG_NODES_SPAN_OTHER_NODES=y/d' \
                -i -e '/# CONFIG_NUMA_EMU is not set/d' \
                -i -e '/CONFIG_NODES_SHIFT=6/d' \
                -i -e '/CONFIG_NEED_MULTIPLE_NODES=y/d' \
                -i -e '/# CONFIG_MOVABLE_NODE is not set/d' \
                -i -e '/CONFIG_USE_PERCPU_NUMA_NODE_ID=y/d' \
                -i -e '/CONFIG_ACPI_NUMA=y/d' ./.config
        fi
    fi

    if [ -n "$_enable_BFQ" ]; then
        sed -i -e '/CONFIG_DEFAULT_IOSCHED/ s,cfq,bfq,' \
            -i -e s'/CONFIG_DEFAULT_CFQ=y/# CONFIG_DEFAULT_CFQ is not set\nCONFIG_DEFAULT_BFQ=y/' ./.config
    fi

    sed -ri "s|^(EXTRAVERSION =).*|\1 -${pkgrel}|" Makefile

    sed -i '2iexit 0' scripts/depmod.sh

    make prepare

    if [ -n "$_localmodcfg" ]; then
        if [ -e /usr/bin/modprobed_db ]; then
            [[ ! -x /usr/bin/sudo ]] && echo "Cannot call modprobe with sudo.  Install via pacman -S sudo and configure to work with this user." && exit 1
            sudo /usr/bin/modprobed_db recall
        fi
        make localmodconfig
    fi

    #make menuconfig
    #make nconfig
    #make xconfig
}

build() {
    cd "${srcdir}/linux-3.14.54"

    make ${MAKEFLAGS} LOCALVERSION= bzImage modules
}

package_linux-lts314-ck() {
    pkgdesc='Linux 3.14 with Brain Fuck Scheduler'
    depends=('coreutils' 'linux-firmware' 'kmod' 'mkinitcpio>=0.7')
    optdepends=('crda: to set the correct wireless channels of your country' 'modprobed_db: Keeps track of EVERY kernel module that has ever been probed - useful for those of us who make localmodconfig')
    backup=("etc/mkinitcpio.d/linux-lts314-ck.preset")
    install=linux-lts314-ck.install

    cd "${srcdir}/linux-3.14.54"

    KARCH=x86

    _kernver="$(make LOCALVERSION= kernelrelease)"

    mkdir -p "${pkgdir}"/{lib/modules,lib/firmware,boot}
    make LOCALVERSION= INSTALL_MOD_PATH="${pkgdir}" modules_install
    cp arch/$KARCH/boot/bzImage "${pkgdir}/boot/vmlinuz-linux-lts314-ck"

    cp -f "${startdir}/${install}" "${startdir}/${install}.pkg"
    true && install=${install}.pkg
    sed -e  "s/KERNEL_NAME=.*/KERNEL_NAME=-lts314-ck/g" \
        -e  "s/KERNEL_VERSION=.*/KERNEL_VERSION=${_kernver}/g" \
        -i "${startdir}/${install}"

    install -D -m644 "${srcdir}/linux-lts314-ck.preset" "${pkgdir}/etc/mkinitcpio.d/linux-lts314-ck.preset"
    sed -e "1s|'linux.*'|'linux-lts314-ck'|" \
        -e "s|ALL_kver=.*|ALL_kver=\"/boot/vmlinuz-linux-lts314-ck\"|" \
        -e "s|default_image=.*|default_image=\"/boot/initramfs-linux-lts314-ck.img\"|" \
        -e "s|fallback_image=.*|fallback_image=\"/boot/initramfs-linux-lts314-ck-fallback.img\"|" \
        -i "${pkgdir}/etc/mkinitcpio.d/linux-lts314-ck.preset"

    rm -f "${pkgdir}"/lib/modules/${_kernver}/{source,build}
    rm -rf "${pkgdir}/lib/firmware"
    find "${pkgdir}" -name '*.ko' -exec gzip -9 {} \;
    ln -s "../extramodules-${_basekernel}${_kernelname:lts314-ck}" "${pkgdir}/lib/modules/${_kernver}/extramodules"
    mkdir -p "${pkgdir}/lib/modules/extramodules-${_basekernel}${_kernelname:lts314-ck}"
    echo "${_kernver}" > "${pkgdir}/lib/modules/extramodules-${_basekernel}${_kernelname:lts314-ck}/version"

    depmod -b "${pkgdir}" -F System.map "${_kernver}"

    mkdir -p "${pkgdir}/usr"
    mv "${pkgdir}/lib" "${pkgdir}/usr/"

    install -D -m644 vmlinux "${pkgdir}/usr/lib/modules/${_kernver}/build/vmlinux"
}

package_linux-lts314-ck-headers() {
    pkgdesc='Header files and scripts for linux-lts314-ck'
    depends=('linux-lts314-ck')

    install -dm755 "${pkgdir}/usr/lib/modules/${_kernver}"

    cd "${srcdir}/linux-3.14.54"
    install -D -m644 Makefile \
        "${pkgdir}/usr/lib/modules/${_kernver}/build/Makefile"
    install -D -m644 kernel/Makefile \
        "${pkgdir}/usr/lib/modules/${_kernver}/build/kernel/Makefile"
    install -D -m644 .config \
        "${pkgdir}/usr/lib/modules/${_kernver}/build/.config"

    mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/include"

    for i in acpi asm-generic config crypto drm generated keys linux math-emu media net pcmcia scsi sound trace uapi video xen; do
        cp -a include/${i} "${pkgdir}/usr/lib/modules/${_kernver}/build/include/"
    done

    mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/arch/x86"
    cp -a arch/x86/include "${pkgdir}/usr/lib/modules/${_kernver}/build/arch/x86/"

    cp Module.symvers "${pkgdir}/usr/lib/modules/${_kernver}/build"
    cp -a scripts "${pkgdir}/usr/lib/modules/${_kernver}/build"

    chmod og-w -R "${pkgdir}/usr/lib/modules/${_kernver}/build/scripts"
    mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/.tmp_versions"

    mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/arch/${KARCH}/kernel"

    cp arch/${KARCH}/Makefile "${pkgdir}/usr/lib/modules/${_kernver}/build/arch/${KARCH}/"

    if [ "${CARCH}" = "i686" ]; then
        cp arch/${KARCH}/Makefile_32.cpu "${pkgdir}/usr/lib/modules/${_kernver}/build/arch/${KARCH}/"
    fi

    cp arch/${KARCH}/kernel/asm-offsets.s "${pkgdir}/usr/lib/modules/${_kernver}/build/arch/${KARCH}/kernel/"

    install -D -m644 Documentation/DocBook/Makefile \
        "${pkgdir}/usr/lib/modules/${_kernver}/build/Documentation/DocBook/Makefile"

    mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/drivers/md"
    cp drivers/md/*.h "${pkgdir}/usr/lib/modules/${_kernver}/build/drivers/md"

    mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/include/linux"
    cp include/linux/inotify.h "${pkgdir}/usr/lib/modules/${_kernver}/build/include/linux/"

    mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/net/mac80211"
    cp net/mac80211/*.h "${pkgdir}/usr/lib/modules/${_kernver}/build/net/mac80211/"

    mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/drivers/media/dvb-core"
    cp drivers/media/dvb-core/*.h "${pkgdir}/usr/lib/modules/${_kernver}/build/drivers/media/dvb-core/"

    mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/include/config/dvb"
    cp include/config/dvb/*.h "${pkgdir}/usr/lib/modules/${_kernver}/build/include/config/dvb/"

    mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/drivers/media/dvb-frontends"
    cp drivers/media/dvb-frontends/lgdt330x.h "${pkgdir}/usr/lib/modules/${_kernver}/build/drivers/media/dvb-frontends/"

    mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/drivers/media/i2c"
    cp drivers/media/i2c/msp3400-driver.h "${pkgdir}/usr/lib/modules/${_kernver}/build/drivers/media/i2c/"

    mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/drivers/media/usb/dvb-usb"
    cp drivers/media/usb/dvb-usb/*.h "${pkgdir}/usr/lib/modules/${_kernver}/build/drivers/media/usb/dvb-usb/"

    mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/drivers/media/dvb-frontends"
    cp drivers/media/dvb-frontends/*.h "${pkgdir}/usr/lib/modules/${_kernver}/build/drivers/media/dvb-frontends/"

    mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/drivers/media/tuners"
    cp drivers/media/tuners/*.h "${pkgdir}/usr/lib/modules/${_kernver}/build/drivers/media/tuners/"

    mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/fs/xfs"
    mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/mm"
    cp fs/xfs/xfs_sb.h "${pkgdir}/usr/lib/modules/${_kernver}/build/fs/xfs/xfs_sb.h"

    for i in $(find . -name "Kconfig*"); do
        mkdir -p "${pkgdir}"/usr/lib/modules/${_kernver}/build/`echo ${i} | sed 's|/Kconfig.*||'`
        cp ${i} "${pkgdir}/usr/lib/modules/${_kernver}/build/${i}"
    done

    chown -R root.root "${pkgdir}/usr/lib/modules/${_kernver}/build"
    find "${pkgdir}/usr/lib/modules/${_kernver}/build" -type d -exec chmod 755 {} \;

    find "${pkgdir}/usr/lib/modules/${_kernver}/build/scripts" -type f -perm -u+w 2>/dev/null | while read binary ; do
        case "$(file -bi "${binary}")" in
            *application/x-sharedlib*) # Libraries (.so)
                /usr/bin/strip ${STRIP_SHARED} "${binary}";;
            *application/x-archive*) # Libraries (.a)
                /usr/bin/strip ${STRIP_STATIC} "${binary}";;
            *application/x-executable*) # Binaries
                /usr/bin/strip ${STRIP_BINARIES} "${binary}";;
        esac
    done

    rm -rf "${pkgdir}"/usr/src/linux-${_kernver}/arch/{alpha,arc,arm,arm26,arm64,avr32,blackfin,c6x,cris,frv,h8300,hexagon,ia64,m32r,m68k,m68knommu,metag,mips,microblaze,mn10300,openrisc,parisc,powerpc,ppc,s390,score,sh,sh64,sparc,sparc64,tile,unicore32,um,v850,xtensa}
}
