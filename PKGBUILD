# Maintainer: taotieren <admin@taotieren.com>
# Contributor: KafCoppelia <k740677208@gmail.com>

pkgbase=xuantie-900-series-toolchain-bin
_platform_linux_ver1=linux-6.6.0
_platform_linux_ver2=linux-5.10.4
pkgname=(
    $pkgbase 
    riscv64-xuantie-900-${_platform_linux_ver1}-glibc-gcc-bin
    riscv64-xuantie-900-elf-newlib-gcc-bin
    riscv64-xuantie-900-${_platform_linux_ver1}-musl32-gcc-bin
    riscv64-xuantie-900-${_platform_linux_ver1}-musl64-gcc-bin
    riscv64-xuantie-900-${_platform_linux_ver2}-musl32-gcc-bin
    riscv64-xuantie-900-${_platform_linux_ver2}-musl64-gcc-bin
    xuantie-900-series-manual
)
pkgver=3.1.0
pkgrel=1
arch=('x86_64')
url=https://www.xrvm.cn/community/download?id=4460156621967921152
license=('unknown')
_dwurl=https://occ-oss-prod.oss-cn-hangzhou.aliyuncs.com/resource/
source=(
    # Plateform Linux 6.6.0
    "riscv64-xuantie-900-${_platform_linux_ver1}-glibc-gcc-bin-${pkgver}.tar.gz::${_dwurl}/1749714096626/Xuantie-900-gcc-${_platform_linux_ver1}-glibc-${arch}-V${pkgver}-20250522.tar.gz"
    "riscv64-xuantie-900-elf-newlib-gcc-bin-${pkgver}.tar.gz::${_dwurl}/1749713644464/Xuantie-900-gcc-elf-newlib-${arch}-V${pkgver}-20250522.tar.gz"
    "riscv64-xuantie-900-${_platform_linux_ver1}-musl32-gcc-bin-${pkgver}.tar.gz::${_dwurl}/1749714478447/Xuantie-900-gcc-${_platform_linux_ver1}-musl32-${arch}-V${pkgver}-20250522.tar.gz"
    "riscv64-xuantie-900-${_platform_linux_ver1}-musl64-gcc-bin-${pkgver}.tar.gz::${_dwurl}/1749714731032/Xuantie-900-gcc-${_platform_linux_ver1}-musl64-${arch}-V${pkgver}-20250522.tar.gz"
    # Plateform Linux 5.10.4
    "riscv64-xuantie-900-${_platform_linux_ver2}-musl32-gcc-bin-${pkgver}.tar.gz::${_dwurl}/1749719378087/Xuantie-900-gcc-${_platform_linux_ver2}-musl32-${arch}-V${pkgver}-20250522.tar.gz"
    "riscv64-xuantie-900-${_platform_linux_ver2}-musl64-gcc-bin-${pkgver}.tar.gz::${_dwurl}/1749713312767/Xuantie-900-gcc-${_platform_linux_ver2}-musl64-${arch}-V${pkgver}-20250522.tar.gz"
    # Documentation
    "ReleaseNote ${pkgver}.pdf::${_dwurl}/1751456888661/ReleaseNote.pdf"
    "Xuantie 900 Series Assembler Manual ${pkgver}.pdf::${_dwurl}/1749713280665/Xuantie+900+Series+Assembler+Manual.pdf"
    "Xuantie 900 Series Binutils Manual ${pkgver}.pdf::${_dwurl}/1749713262134/Xuantie+900+Series+Binutils+Manual.pdf"
    "Xuantie 900 Series Compiler Manual ${pkgver}.pdf::${_dwurl}/1749713246911/Xuantie+900+Series+Compiler+Manual.pdf"
    "Xuantie 900 Series Linker Manual ${pkgver}.pdf::${_dwurl}/1749713201314/Xuantie+900+Series+Linker+Manual.pdf"
    "Xuantie 900 Series GDB Manual ${pkgver}.pdf::${_dwurl}/1749713226909/Xuantie+900+Series+GDB+Manual.pdf"
    "Xuantie 900 Series P-0.9.4 Intrinsic Manual ${pkgver}.pdf::${_dwurl}/1749713180262/Xuantie+900+Series+P-0.9.4+Intrinsic+Manual.pdf"
    "Xuantie 900 Series RVM-0.3 Intrinsic Manual ${pkgver}.pdf::${_dwurl}/1749713163469/Xuantie+900+Series+RVM-0.3+Intrinsic+Manual.pdf"
    "Xuantie 900 Series RVV-0.7.1 Intrinsic Manual ${pkgver}.pdf::${_dwurl}/1749713137857/Xuantie+900+Series+RVV-0.7.1+Intrinsic+Manual.pdf"
    "Xuantie 900 Series RVV-1.0 Intrinsic Manual ${pkgver}.pdf::${_dwurl}/1749713118434/Xuantie+900+Series+RVV-1.0+Intrinsic+Manual.pdf"
)

sha256sums=('129d8d31ea025183f184b0c652cbd5f7e75ebf53b7d0f736d326348dceb2d7ec'
            '72784c91c3e6be0d8d312237adac0c565b67bbf8f8c81280b291805da5f75f24'
            '852d66fdcbd444e067fe69d2bfcfd0f8424e285b15fffff23ae910dca7c2d254'
            'ca2da7c80cc58d6f06eee5dba91c1b1530a00c19eeafb1eaf274ca06165cad69'
            'f231d2bcda15a4e7696ca56b681cee6657b42fc422049c43c46d8283c5a57cd9'
            '395f201713c2be0ea5969c92a1a0fdfe16b17ee98a15e26e8354f750fa14ee18'
            'c9c8a9846230f0cdc4bc043f1ba3339c34aca4dcfebb46e14a4afd5d1541a6a9'
            '0455538e62307d3e4bc79cbd8257ed42292c32e31dd7ad4eebcb215a89cdeeff'
            'cd45c42cab736c413a5ae55c0a620e527ef6e615e113505b65f010beada54e95'
            '2c4ec6f462cbb8b43ee1233d00aa91173232678662c244850cbdcd7527a87745'
            'b3221c0563f5eac174193ba251dc7fae5788eb327ee9455c535a9260a35893c5'
            '7d3f1b686e989651558bf5c2bb8705817c6fc3d2054f184a81cad2416ab0e6c0'
            '595aece3631d8c82429c2f95a91bbf8cd908eb89b173b2d2e7f99fd0e45f2076'
            '7689baeda6498081c5f196f69de8c7f15c4bbbe895d849e51d63bbb7f85d6fbe'
            'e0f18425e67e036559fdbc61a510278d7e435ef78fce241c83e77face258765f'
            'cc3b08380991716f8c7c5ed9619130c609ce0a8f89b3d6dafa963520cacdbab7')

noextract=(
    riscv64-xuantie-900-${_platform_linux_ver1}-glibc-gcc-bin-${pkgver}.tar.gz
    riscv64-xuantie-900-elf-newlib-gcc-bin-${pkgver}.tar.gz
    riscv64-xuantie-900-${_platform_linux_ver1}-musl32-gcc-bin-${pkgver}.tar.gz
    riscv64-xuantie-900-${_platform_linux_ver1}-musl64-gcc-bin-${pkgver}.tar.gz
)
options=('!strip')
_toolchain_name="xuantie-900-gcc"

package_xuantie-900-series-toolchain-bin() {
    pkgdesc="Xuantie 900 series toolchain"
    depends=(
        riscv64-xuantie-900-${_platform_linux_ver1}-glibc-gcc-bin
        riscv64-xuantie-900-elf-newlib-gcc-bin
        riscv64-xuantie-900-${_platform_linux_ver1}-musl32-gcc-bin
        riscv64-xuantie-900-${_platform_linux_ver1}-musl64-gcc-bin
        riscv64-xuantie-900-${_platform_linux_ver2}-musl32-gcc-bin
        riscv64-xuantie-900-${_platform_linux_ver2}-musl64-gcc-bin
        xuantie-900-series-manual
    )
}

package_riscv64-xuantie-900-linux-6.6.0-glibc-gcc-bin() {
    pkgdesc="Xuantie 900 riscv64 glibc toolchain targetting plateform linux 6.6.0"
    install -dm0755 ${pkgdir}/opt/${_toolchain_name}/${pkgname%-bin}

    bsdtar -xf ${srcdir}/${pkgname}-${pkgver}.tar.gz --strip-components=1 -C ${pkgdir}/opt/${_toolchain_name}/${pkgname%-bin} --no-same-owner --no-same-permissions

    install -Dm0755 /dev/stdin ${pkgdir}/etc/profile.d/${pkgname%-bin}.sh << EOF
#!/bin/sh
[ -d /opt/${_toolchain_name}/${pkgname%-bin}/bin ] && append_path '/opt/${_toolchain_name}/${pkgname%-bin}/bin'

export PATH
EOF
}

package_riscv64-xuantie-900-elf-newlib-gcc-bin() {
    pkgdesc="Xuantie 900 riscv64 elf newlib toolchain"
    install -dm0755 ${pkgdir}/opt/${_toolchain_name}/${pkgname%-bin}

    bsdtar -xf ${srcdir}/${pkgname}-${pkgver}.tar.gz --strip-components=1 -C ${pkgdir}/opt/${_toolchain_name}/${pkgname%-bin} --no-same-owner --no-same-permissions

    install -Dm0755 /dev/stdin ${pkgdir}/etc/profile.d/${pkgname%-bin}.sh << EOF
#!/bin/sh
[ -d /opt/${_toolchain_name}/${pkgname%-bin}/bin ] && append_path '/opt/${_toolchain_name}/${pkgname%-bin}/bin'

export PATH
EOF
}

package_riscv64-xuantie-900-linux-6.6.0-musl32-gcc-bin() {
    pkgdesc="Xuantie 900 riscv64 musl32 toolchain targetting plateform linux 6.6.0"
    install -dm0755 ${pkgdir}/opt/${_toolchain_name}/${pkgname%-bin}

    bsdtar -xf ${srcdir}/${pkgname}-${pkgver}.tar.gz --strip-components=1 -C ${pkgdir}/opt/${_toolchain_name}/${pkgname%-bin} --no-same-owner --no-same-permissions

    install -Dm0755 /dev/stdin ${pkgdir}/etc/profile.d/${pkgname%-bin}.sh << EOF
#!/bin/sh
[ -d /opt/${_toolchain_name}/${pkgname%-bin}/bin ] && append_path '/opt/${_toolchain_name}/${pkgname%-bin}/bin'

export PATH
EOF
}

package_riscv64-xuantie-900-linux-6.6.0-musl64-gcc-bin() {
    pkgdesc="Xuantie 900 riscv64 musl64 toolchain targetting plateform linux 6.6.0"
    install -dm0755 ${pkgdir}/opt/${_toolchain_name}/${pkgname%-bin}

    bsdtar -xf ${srcdir}/${pkgname}-${pkgver}.tar.gz --strip-components=1 -C ${pkgdir}/opt/${_toolchain_name}/${pkgname%-bin} --no-same-owner --no-same-permissions

    install -Dm0755 /dev/stdin ${pkgdir}/etc/profile.d/${pkgname%-bin}.sh << EOF
#!/bin/sh
[ -d /opt/${_toolchain_name}/${pkgname%-bin}/bin ] && append_path '/opt/${_toolchain_name}/${pkgname%-bin}/bin'

export PATH
EOF
}

package_riscv64-xuantie-900-linux-5.10.4-musl32-gcc-bin() {
    pkgdesc="Xuantie 900 riscv64 musl32 toolchain targetting plateform linux 5.10.4"
    install -dm0755 ${pkgdir}/opt/${_toolchain_name}/${pkgname%-bin}

    bsdtar -xf ${srcdir}/${pkgname}-${pkgver}.tar.gz --strip-components=1 -C ${pkgdir}/opt/${_toolchain_name}/${pkgname%-bin} --no-same-owner --no-same-permissions

    install -Dm0755 /dev/stdin ${pkgdir}/etc/profile.d/${pkgname%-bin}.sh << EOF
#!/bin/sh
[ -d /opt/${_toolchain_name}/${pkgname%-bin}/bin ] && append_path '/opt/${_toolchain_name}/${pkgname%-bin}/bin'

export PATH
EOF
}

package_riscv64-xuantie-900-linux-5.10.4-musl64-gcc-bin() {
    pkgdesc="Xuantie 900 riscv64 musl64 toolchain targetting plateform linux 5.10.4"
    install -dm0755 ${pkgdir}/opt/${_toolchain_name}/${pkgname%-bin}

    bsdtar -xf ${srcdir}/${pkgname}-${pkgver}.tar.gz --strip-components=1 -C ${pkgdir}/opt/${_toolchain_name}/${pkgname%-bin} --no-same-owner --no-same-permissions

    install -Dm0755 /dev/stdin ${pkgdir}/etc/profile.d/${pkgname%-bin}.sh << EOF
#!/bin/sh
[ -d /opt/${_toolchain_name}/${pkgname%-bin}/bin ] && append_path '/opt/${_toolchain_name}/${pkgname%-bin}/bin'

export PATH
EOF
}

package_xuantie-900-series-manual() {
    pkgdesc="Xuantie 900 series manual"
    install -dm0755 ${pkgdir}/opt/${_toolchain_name}/${pkgname%-bin}

    cp -ar ${srcdir}/*${pkgver}.pdf ${pkgdir}/opt/${_toolchain_name}/${pkgname%-bin}
}
