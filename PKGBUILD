# Maintainer: taotieren <admin@taotieren.com>
# Contributor: KafCoppelia <k740677208@gmail.com>

pkgbase=xuantie-900-series-toolchain-bin
_platform_linux_ver=linux-6.6.0
pkgname=(
    $pkgbase 
    riscv64-xuantie-900-${_platform_linux_ver}-glibc-gcc-bin
    riscv64-xuantie-900-elf-newlib-gcc-bin
    riscv64-xuantie-900-${_platform_linux_ver}-musl32-gcc-bin
    riscv64-xuantie-900-${_platform_linux_ver}-musl64-gcc-bin
    xuantie-900-series-manual
)
pkgver=3.2.0
pkgrel=1
arch=('x86_64')
url=https://www.xrvm.cn/community/download?id=4460156621967921152
license=('unknown')
_dwurl=https://occ-oss-prod.oss-cn-hangzhou.aliyuncs.com/resource/
_date=20250627
source=(
    # Plateform Linux 6.6.0
    "riscv64-xuantie-900-${_platform_linux_ver}-glibc-gcc-bin-${pkgver}.tar.gz::${_dwurl}/1755679709552/Xuantie-900-gcc-${_platform_linux_ver}-glibc-${arch}-V${pkgver}-${_date}.tar.gz"
    "riscv64-xuantie-900-elf-newlib-gcc-bin-${pkgver}.tar.gz::${_dwurl}/1751370399722/Xuantie-900-gcc-elf-newlib-${arch}-V${pkgver}-${_date}.tar.gz"
    "riscv64-xuantie-900-${_platform_linux_ver}-musl32-gcc-bin-${pkgver}.tar.gz::${_dwurl}/1755680614007/Xuantie-900-gcc-${_platform_linux_ver}-musl32-${arch}-V${pkgver}-${_date}.tar.gz"
    "riscv64-xuantie-900-${_platform_linux_ver}-musl64-gcc-bin-${pkgver}.tar.gz::${_dwurl}/1755680903502/Xuantie-900-gcc-${_platform_linux_ver}-musl64-${arch}-V${pkgver}-${_date}.tar.gz"
    # Documentation
    "ReleaseNote ${pkgver}.pdf::${_dwurl}/1751456888661/ReleaseNote.pdf"
    "Xuantie 900 Series Assembler Manual ${pkgver}.pdf::${_dwurl}/1751457183077/Xuantie+900+Series+Assembler+Manual.pdf"
    "Xuantie 900 Series Binutils Manual ${pkgver}.pdf::${_dwurl}/1751457200530/Xuantie+900+Series+Binutils+Manual.pdf"
    "Xuantie 900 Series Compiler Manual ${pkgver}.pdf::${_dwurl}/1751457224360/Xuantie+900+Series+Compiler+Manual.pdf"
    "Xuantie 900 Series Linker Manual ${pkgver}.pdf::${_dwurl}/1751457272624/Xuantie+900+Series+Linker+Manual.pdf"
    "Xuantie 900 Series GDB Manual ${pkgver}.pdf::${_dwurl}/1751457252777/Xuantie+900+Series+GDB+Manual.pdf"
    "Xuantie 900 Series P-0.9.4 Intrinsic Manual ${pkgver}.pdf::${_dwurl}/1751457311943/Xuantie+900+Series+P-0.9.4+Intrinsic+Manual.pdf"
    "Xuantie 900 Series RVM-0.3 Intrinsic Manual ${pkgver}.pdf::${_dwurl}/1751457332661/Xuantie+900+Series+RVM-0.3+Intrinsic+Manual.pdf"
    "Xuantie 900 Series RVV-0.7.1 Intrinsic Manual ${pkgver}.pdf::${_dwurl}/1751457354757/Xuantie+900+Series+RVV-0.7.1+Intrinsic+Manual.pdf"
    "Xuantie 900 Series RVV-1.0 Intrinsic Manual ${pkgver}.pdf::${_dwurl}/1751457381023/Xuantie+900+Series+RVV-1.0+Intrinsic+Manual.pdf"
)

sha256sums=('a5a6a5e517a738baffed091efce984ffa215f78bb11e296d6175bf5896778fdd'
            '80c174c6445f7565bc082d328045021862a63beddfad8c393c534e2d9523dc3b'
            '9da3d326ef6ddb6383b95221037e0b5f254ca800f3bb0c0383006781eb89bdb1'
            'ddb940dd50fe30db654479764ee3fbfcd8e78b697fb4491bb6ceb15c353e997f'
            'c9c8a9846230f0cdc4bc043f1ba3339c34aca4dcfebb46e14a4afd5d1541a6a9'
            'b58245a7f0f21416637362008c91eb287d69111a1dc6c9a0b4371f72aeaa2f2e'
            '566b3f3bab0b521046451a9ba17d20bfd76f86076a713bdbea266a7f0f6d38ab'
            'bf7f1dbe78b77af6693b830f4d943c0f1c41faad2628f881c30ec42510caeffc'
            'e3c6ec78ea7ee56bfb4a73a2f3cf2685fa6cf0c58ce8a07157b293deca0e92bb'
            '14e973329fc9c6df7812f9ba5f9ca20ad8e243b19bcf5335cbf2677d6c851b06'
            '595aece3631d8c82429c2f95a91bbf8cd908eb89b173b2d2e7f99fd0e45f2076'
            'a963c36d90cbe00d025ed62a55a051a367007d829c1893456c4dc294f73b74ee'
            '28722ab42b5531e67ded49a7836352c5435fa0e9a50b574d01ef8a81f26ecf6e'
            '6b4530fc6665c2fa9db2137226264c7ac423528fd0e2289500038d05152a75ee')

noextract=(
    riscv64-xuantie-900-${_platform_linux_ver}-glibc-gcc-bin-${pkgver}.tar.gz
    riscv64-xuantie-900-elf-newlib-gcc-bin-${pkgver}.tar.gz
    riscv64-xuantie-900-${_platform_linux_ver}-musl32-gcc-bin-${pkgver}.tar.gz
    riscv64-xuantie-900-${_platform_linux_ver}-musl64-gcc-bin-${pkgver}.tar.gz
)
options=('!strip')
_toolchain_name="xuantie-900-gcc"

package_xuantie-900-series-toolchain-bin() {
    pkgdesc="Xuantie 900 series toolchain"
    depends=(
        riscv64-xuantie-900-${_platform_linux_ver}-glibc-gcc-bin
        riscv64-xuantie-900-elf-newlib-gcc-bin
        riscv64-xuantie-900-${_platform_linux_ver}-musl32-gcc-bin
        riscv64-xuantie-900-${_platform_linux_ver}-musl64-gcc-bin
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

package_xuantie-900-series-manual() {
    pkgdesc="Xuantie 900 series manual"
    install -dm0755 ${pkgdir}/opt/${_toolchain_name}/${pkgname%-bin}

    cp -ar ${srcdir}/*${pkgver}.pdf ${pkgdir}/opt/${_toolchain_name}/${pkgname%-bin}
}
