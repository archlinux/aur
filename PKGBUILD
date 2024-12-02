# Maintainer: taotieren <admin@taotieren.com>

pkgbase=csky-toolchain-900-series-bin
pkgname=($pkgbase csky-riscv64-linux-900-series-bin csky-riscv64-elf-900-series-bin csky-toolchain-900-series-guide-bin)
pkgver=2.10.2
pkgrel=1
arch=('x86_64')
_id=4352528597269942272
url=https://www.xrvm.cn/community/download?id=${_id}
license=('Apache')
provides=()
#conflicts=()
depends=('filesystem')
makedepends=('libarchive')
options=('!strip' '!debug' '!lto')
_url="https://occ-oss-prod.oss-cn-hangzhou.aliyuncs.com/resource"
_dwurl="${_url}/"
_date=20240904

# https://occ-oss-prod.oss-cn-hangzhou.aliyuncs.com/resource/1836682/1725612383347/Xuantie-900-gcc-linux-6.6.0-glibc-x86_64-V2.10.2-20240904.tar.gz
# https://occ-oss-prod.oss-cn-hangzhou.aliyuncs.com/resource//1725611943439/Xuantie-900-gcc-elf-newlib-x86_64-V2.10.2-20240904.tar.gz
# https://occ-oss-prod.oss-cn-hangzhou.aliyuncs.com/resource/1836682/1725611736797/ReleaseNote.pdf
# https://occ-oss-prod.oss-cn-hangzhou.aliyuncs.com/resource//1725612867727/Xuantie+900+Series+Assembler+Manual.pdf
# https://occ-oss-prod.oss-cn-hangzhou.aliyuncs.com/resource//1725612888080/Xuantie+900+Series+Binutils+Manual.pdf
# https://occ-oss-prod.oss-cn-hangzhou.aliyuncs.com/resource//1725612909409/Xuantie+900+Series+Compiler+Manual.pdf
# https://occ-oss-prod.oss-cn-hangzhou.aliyuncs.com/resource/1836682/1725612969279/Xuantie+900+Series+GDB+Manual.pdf
# https://occ-oss-prod.oss-cn-hangzhou.aliyuncs.com/resource//1725613011362/Xuantie+900+Series+Linker+Manual.pdf
# https://occ-oss-prod.oss-cn-hangzhou.aliyuncs.com/resource//1725613041057/Xuantie+900+Series+P-0.9.4+Intrinsic+Manual.pdf
# https://occ-oss-prod.oss-cn-hangzhou.aliyuncs.com/resource//1725613107411/Xuantie+900+Series+RVM-0.3+Intrinsic+Manual.pdf
# https://occ-oss-prod.oss-cn-hangzhou.aliyuncs.com/resource//1725613070959/Xuantie+900+Series+RVV-0.7.1+Intrinsic+Manual.pdf
# https://occ-oss-prod.oss-cn-hangzhou.aliyuncs.com/resource//1725613126668/Xuantie+900+Series+RVV-1.0+Intrinsic+Manual.pdf
# https://occ-oss-prod.oss-cn-hangzhou.aliyuncs.com/resource//1732861513671/%E7%8E%84%E9%93%81CPU%E8%BD%AF%E4%BB%B6%E5%BC%80%E5%8F%91%E6%8C%87%E5%8D%97V3.4.pdf
# https://occ-oss-prod.oss-cn-hangzhou.aliyuncs.com/resource//1668484121020/XuanTie+Linux+%E5%BC%80%E5%8F%91%E5%B9%B3%E5%8F%B0%E4%BD%BF%E7%94%A8%E8%AF%B4%E6%98%8E_20221111.pdf
source=("csky-riscv64-linux-900-series-bin-${pkgver}.tar.gz::${_url}/1836682/1725612383347/Xuantie-900-gcc-linux-6.6.0-glibc-x86_64-V${pkgver}-${_date}.tar.gz"
    "csky-riscv64-elf-900-series-bin-${pkgver}.tar.gz::${_dwurl}/1725611943439/Xuantie-900-gcc-elf-newlib-x86_64-V${pkgver}-${_date}.tar.gz"
    "ReleaseNote ${pkgver}.pdf::${_url}/1836682/1725611736797/ReleaseNote.pdf"
    "Xuantie 900 Series Assembler Manual ${pkgver}.pdf::${_dwurl}/1725612867727/Xuantie+900+Series+Assembler+Manual.pdf"
    "Xuantie 900 Series Binutils Manual ${pkgver}.pdf::${_dwurl}/1725612888080/Xuantie+900+Series+Binutils+Manual.pdf"
    "Xuantie 900 Series Compiler Manual ${pkgver}.pdf::${_dwurl}/1725612909409/Xuantie+900+Series+Compiler+Manual.pdf"
    "Xuantie 900 Series GDB Manual ${pkgver}.pdf::${_url}/1836682/1725612969279/Xuantie+900+Series+GDB+Manual.pdf"
    "Xuantie 900 Series Linker Manual ${pkgver}.pdf::${_dwurl}/1725613011362/Xuantie+900+Series+Linker+Manual.pdf"
    "Xuantie 900 Series P-0.9.4 Intrinsic Manual ${pkgver}.pdf::${_dwurl}/1725613041057/Xuantie+900+Series+P-0.9.4+Intrinsic+Manual.pdf"
    "Xuantie 900 Series RVM-0.3 Intrinsic+Manual ${pkgver}.pdf::${_dwurl}/1725613107411/Xuantie+900+Series+RVM-0.3+Intrinsic+Manual.pdf"
    "Xuantie 900 Series RVV-0.7.1 Intrinsic Manual ${pkgver}.pdf::${_dwurl}/1725613070959/Xuantie+900+Series+RVV-0.7.1+Intrinsic+Manual.pdf"
    "Xuantie 900 Series RVV-1.0 Intrinsic Manual ${pkgver}.pdf::${_dwurl}/1725613126668/Xuantie+900+Series+RVV-1.0+Intrinsic+Manual.pdf"
    "玄铁CPU软件开发指南V3.4 ${pkgver}.pdf::${_url}//1732861513671/%E7%8E%84%E9%93%81CPU%E8%BD%AF%E4%BB%B6%E5%BC%80%E5%8F%91%E6%8C%87%E5%8D%97V3.4.pdf"
    "XuanTie Linux 开发平台使用说明 ${pkgver}.pdf::${_url}//1668484121020/XuanTie+Linux+%E5%BC%80%E5%8F%91%E5%B9%B3%E5%8F%B0%E4%BD%BF%E7%94%A8%E8%AF%B4%E6%98%8E_20221111.pdf")

sha256sums=('0e4a511c800a4a7ae5313cff29f93cc7e1306002da9eed85931f82cf921e1285'
            'f366a7913dc42e32555065201b8c660a4ed8a562a6956019aa775573323ae111'
            'bb8cb4de43c2626d9dfa5725939cd99630dde349faa67e58472202348e4bb8c0'
            '76fd6d9d50ea342c8da72702073a93e0c70c56e8c0bf54bc1a3011afc288f2f0'
            '7f2be8f8bfc5b4f02c5f3119ac86fffd338e43d6e16f3e798f7aec48e6249eba'
            '1cb2b152d654e66b97fa3d9dcaa034e33953a33f9f00eac20d828f63a7688aab'
            'a7372efc2e032fad382e9e5df293a4eabfec494b5557fb5c90f0c322cfcf078c'
            '06feffe3795f6764e0d6ba0c66f4bc1931ed123eca4c150c856a21d7701e4cd3'
            '595aece3631d8c82429c2f95a91bbf8cd908eb89b173b2d2e7f99fd0e45f2076'
            '30636f6f0023edcba5f86cd52814ce4c01398140aa129928becebece3d1e4215'
            '2e1558a3746bb4a802d6f191ab340181e2c083a7b5bd2bcd780809ce295f7c0b'
            '84898e73f5187c2fad4dd082f25f18974f6da1b09dd0c347615fb8a35038fa6a'
            '91c79e11c81426b907bd5d92ad04256a1d30c1b0f2a72b652b6b7d41287bfd00'
            '77bf95d0126a4401b6685aa93225181ed49dc55e5c0b04bbbae624a582722452')

noextract=(csky-riscv64-linux-900-series-bin-${pkgver}.tar.gz csky-riscv64-elf-900-series-bin-${pkgver}.tar.gz)

package_csky-toolchain-900-series-bin() {
    pkgdesc="C-Sky toolchain 900 series (Xuantie)"
    depends=(csky-riscv64-linux-900-series-bin csky-riscv64-elf-900-series-bin csky-toolchain-900-series-guide-bin)
}

package_csky-riscv64-linux-900-series-bin() {
    pkgdesc="C-Sky riscv64 linux for 900 series (Xuantie)"
    install -dm0755 "${pkgdir}/opt/t-head/${pkgname%-bin}"

    bsdtar -xf "${srcdir}/${pkgname}-${pkgver}.tar.gz" --strip-components=1 -C "${pkgdir}/opt/t-head/${pkgname%-bin}" --no-same-owner --no-same-permissions

    install -Dm0755 /dev/stdin "${pkgdir}/etc/profile.d/${pkgname%-bin}.sh" <<EOF
#!/bin/sh
[ -d /opt/t-head/${pkgname%-bin}/bin ] && append_path '/opt/t-head/${pkgname%-bin}/bin'

export PATH
EOF
}

package_csky-riscv64-elf-900-series-bin() {
    pkgdesc="C-Sky riscv64 elf for 900 series (Xuantie)"
    install -dm0755 "${pkgdir}/opt/t-head/${pkgname%-bin}"

    bsdtar -xf "${srcdir}/${pkgname}-${pkgver}.tar.gz" --strip-components=1 -C "${pkgdir}/opt/t-head/${pkgname%-bin}" --no-same-owner --no-same-permissions

    install -Dm0755 /dev/stdin "${pkgdir}/etc/profile.d/${pkgname%-bin}.sh" <<EOF
#!/bin/sh
[ -d /opt/t-head/${pkgname%-bin}/bin ] && append_path '/opt/t-head/${pkgname%-bin}/bin'

export PATH
EOF
}

package_csky-toolchain-900-series-guide-bin() {
    pkgdesc="C-Sky toolchain guide for 900 series (Xuantie)"
    install -dm0755 "${pkgdir}/opt/t-head/${pkgname%-bin}"

    cp -rva "${srcdir}"/*${pkgver}.pdf "${pkgdir}/opt/t-head/${pkgname%-bin}"
}
# vim: ts=4 sw=4 et
