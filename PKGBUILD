# Maintainer: taotieren <admin@taotieren.com>

pkgbase=csky-toolchain-bin
pkgname=($pkgbase csky-elf-noneabiv2-tools-bin csky-elfabiv2-tools-bin csky-linux-uclibc-tools-bin csky-linux-uclibcabiv2-tools-bin csky-linux-gnuabiv2-tools-bin csky-elf-tools-bin csky-toolchain-guide-bin)
pkgver=3.10.29
pkgrel=2
arch=('x86_64')
url='https://occ.t-head.cn/community/download?id=3885366095506644992'
license=('Apache')
provides=()
#conflicts=()
depends=('filesystem')
makedepends=('tar')

source=("https://occ-oss-prod.oss-cn-hangzhou.aliyuncs.com/resource/null/1614234913073/ReleaseNotes.pdf"
        "csky-elf-noneabiv2-tools-bin-${pkgver}.tar.gz::https://occ-oss-prod.oss-cn-hangzhou.aliyuncs.com/resource/1356021/1619529419771/csky-elf-noneabiv2-tools-x86_64-newlib-20210423.tar.gz"
        "csky-elfabiv2-tools-bin-${pkgver}.tar.gz::https://occ-oss-prod.oss-cn-hangzhou.aliyuncs.com/resource/1356021/1619529111421/csky-elfabiv2-tools-x86_64-minilibc-20210423.tar.gz"
        "csky-linux-uclibc-tools-bin-${pkgver}.tar.gz::https://occ-oss-prod.oss-cn-hangzhou.aliyuncs.com/resource/1356021/1619527806432/csky-linux-uclibc-tools-x86_64-uclibc-linux-4.9.56-20210423.tar.gz"
        "csky-linux-uclibcabiv2-tools-bin-${pkgver}.tar.gz::https://occ-oss-prod.oss-cn-hangzhou.aliyuncs.com/resource/1356021/1619528170242/csky-linux-uclibcabiv2-tools-x86_64-uclibc-linux-4.9.56-20210423.tar.gz"
        "csky-linux-gnuabiv2-tools-bin-${pkgver}.tar.gz::https://occ-oss-prod.oss-cn-hangzhou.aliyuncs.com/resource/1356021/1619528643136/csky-linux-gnuabiv2-tools-x86_64-glibc-linux-4.9.56-20210423.tar.gz"
        "csky-elf-tools-bin-${pkgver}.tar.gz::https://occ-oss-prod.oss-cn-hangzhou.aliyuncs.com/resource/1356021/1619529266702/csky-elf-tools-x86_64-minilibc-20210423.tar.gz"
        "C-SKY ABIV2 Standards Manual.pdf::https://occ-oss-prod.oss-cn-hangzhou.aliyuncs.com/cop-image-prod/resource/420257228264570880/1577083169449/C-SKY+ABIV2+Standards+Manual.pdf"
        "C-SKY Tools V3 User Guide-GDB.pdf::https://occ-oss-prod.oss-cn-hangzhou.aliyuncs.com/cop-image-prod/resource/420257228264570880/1577083297437/C-SKY+Tools+V3+User+Guide-GDB.pdf"
        "C-SKY Tools V3 User Guide-Assembler.pdf::https://occ-oss-prod.oss-cn-hangzhou.aliyuncs.com/cop-image-prod/resource/420257228264570880/1577083259363/C-SKY+Tools+V3+User+Guide-Assembler.pdf"
        "C-SKY Tools V3 User Guide-Link.pdf::https://occ-oss-prod.oss-cn-hangzhou.aliyuncs.com/cop-image-prod/resource/420257228264570880/1577083316694/C-SKY+Tools+V3+User+Guide-Link.pdf"
        "C-SKY Tools V3 User Guide-Binutils.pdf::https://occ-oss-prod.oss-cn-hangzhou.aliyuncs.com/cop-image-prod/resource/420257228264570880/1577083279742/C-SKY+Tools+V3+User+Guide-Binutils.pdf"
        "C-SKY Tools V3 User Guide-Compiler.pdf::https://occ-oss-prod.oss-cn-hangzhou.aliyuncs.com/cop-image-prod/resource/420257228264570880/1577083227863/C-SKY+Tools+V3+User+Guide-Compiler.pdf"
        "C-SKY ABIV1 Standards Manual.pdf::https://occ-oss-prod.oss-cn-hangzhou.aliyuncs.com/cop-image-prod/resource/420257228264570880/1577083146977/C-SKY+ABIV1+Standards+Manual.pdf"
        "T-HEAD 800 Series ABI Standards Manual.pdf::https://occ-oss-prod.oss-cn-hangzhou.aliyuncs.com/resource/1356021/1614835977510/T-HEAD_800_Series_ABI_Standards_Manual.pdf"
        "T-HEAD软件开发指南V1.7.pdf::https://occ-oss-prod.oss-cn-hangzhou.aliyuncs.com/resource/1355977/1615892629021/T-HEAD%E8%BD%AF%E4%BB%B6%E5%BC%80%E5%8F%91%E6%8C%87%E5%8D%97V1.7.pdf"
        )

sha256sums=('e70dca4e839c503d0efff7b078c5418f0d28d0e79a032d50e5e39682507c82ae'
            '2e97e379bf8ec94ef2196ea6c6d62f3d3b291da19a087e3704de43e83415f859'
            '8b9a353c157e4d44001a21974254a21cc0f3c7ea2bf3c894f18a905509a7048f'
            '294514bb90355d8e0da1cb3e26b3d2862e14b861358fa5070a7333b991de725b'
            '6aa00d660ece51b19cbb689e7ce4e0fabeeb3f0a4a84d86fbc42ddbcf88b096f'
            '1a20b552977e2f7793b4ef242d41fbe6dc24fd2d369bdec5c96beb0d209fb676'
            '6d93e925171806136f0b12c4c26c94f3b2dafdc04aa32cd94586f23e39ce673c'
            '055d36544aae5ed7b4c8b8904c97c6b4386ad80a623320fbda1cb43ce9c73a56'
            '9898a9118219666bb4bb5ed84695e286e0cb7872284770c9e1135520ce5bfd1e'
            'b1720cbf06f0afb2a11f98b6961acd11dcf7531a3681b3d071a06587cf54e061'
            'a3e8dc23e2b72e05914501626840754053a0352745ff7dbf744667e4e385e06d'
            'c3972f0b36be4f875a50718e6303917ef3f9240063e12023c768b3e81bd9c6b3'
            '219c07ebdd961bae2e009763a118c30e3a963ec3f134e67f5d6b5248b3d046bd'
            '7229d8a72f7c7900518712365251030fca2f8bfe8dc497cce95dc5fe56576315'
            '1c950ac9da8c2e53f9473e699b53bfeaea79adfa021ac36ef5047101aae94173'
            'f552d20599d73f824e44a03d8ca49fe74b59e838a97352a2596042ba8cad422f')

noextract=(csky-elf-noneabiv2-tools-bin-${pkgver}.tar.gz csky-elfabiv2-tools-bin-${pkgver}.tar.gz csky-linux-uclibc-tools-bin-${pkgver}.tar.gz csky-linux-uclibcabiv2-tools-bin-${pkgver}.tar.gz csky-linux-gnuabiv2-tools-bin-${pkgver}.tar.gz csky-elf-tools-bin-${pkgver}.tar.gz)

package_csky-toolchain-bin() {
    pkgdesc="C-Sky toolchain 800 series"
    depends=(csky-elf-noneabiv2-tools-bin csky-elfabiv2-tools-bin csky-linux-uclibc-tools-bin csky-linux-uclibcabiv2-tools-bin csky-linux-gnuabiv2-tools-bin csky-elf-tools-bin csky-toolchain-guide-bin)
}

package_csky-elf-noneabiv2-tools-bin() {
    pkgdesc="C-Sky elf noneabiv2 tools for 800 series"
    install -dm0755 "${pkgdir}/opt/t-head/${pkgname%-bin}"

    tar -xf "${srcdir}/${pkgname}-${pkgver}.tar.gz" -C "${pkgdir}/opt/t-head/${pkgname%-bin}" --no-same-owner  --no-same-permissions

    install -Dm0755 /dev/stdin "${pkgdir}/etc/profile.d/${pkgname%-bin}.sh" << EOF
#!/bin/sh
[ -d /opt/t-head/${pkgname%-bin}/bin ] && append_path '/opt/t-head/${pkgname%-bin}/bin'

export PATH
EOF
}

package_csky-elfabiv2-tools-bin() {
    pkgdesc="C-Sky elfabiv2 tools for 800 series"
    install -dm0755 "${pkgdir}/opt/t-head/${pkgname%-bin}"

    tar -xf "${srcdir}/${pkgname}-${pkgver}.tar.gz" -C "${pkgdir}/opt/t-head/${pkgname%-bin}" --no-same-owner  --no-same-permissions

    install -Dm0755 /dev/stdin "${pkgdir}/etc/profile.d/${pkgname%-bin}.sh" << EOF
#!/bin/sh
[ -d /opt/t-head/${pkgname%-bin}/bin ] && append_path '/opt/t-head/${pkgname%-bin}/bin'

export PATH
EOF
}

package_csky-linux-uclibc-tools-bin() {
    pkgdesc="C-Sky linux uclibc tools for 800 series"
    install -dm0755 "${pkgdir}/opt/t-head/${pkgname%-bin}"

    tar -xf "${srcdir}/${pkgname}-${pkgver}.tar.gz" -C "${pkgdir}/opt/t-head/${pkgname%-bin}" --no-same-owner  --no-same-permissions

    install -Dm0755 /dev/stdin "${pkgdir}/etc/profile.d/${pkgname%-bin}.sh" << EOF
#!/bin/sh
[ -d /opt/t-head/${pkgname%-bin}/bin ] && append_path '/opt/t-head/${pkgname%-bin}/bin'

export PATH
EOF
}

package_csky-linux-uclibcabiv2-tools-bin() {
    pkgdesc="C-Sky linux uclibcabiv2 tools for 800 series"
    install -dm0755 "${pkgdir}/opt/t-head/${pkgname%-bin}"

    tar -xf "${srcdir}/${pkgname}-${pkgver}.tar.gz" -C "${pkgdir}/opt/t-head/${pkgname%-bin}" --no-same-owner  --no-same-permissions

    install -Dm0755 /dev/stdin "${pkgdir}/etc/profile.d/${pkgname%-bin}.sh" << EOF
#!/bin/sh
[ -d /opt/t-head/${pkgname%-bin}/bin ] && append_path '/opt/t-head/${pkgname%-bin}/bin'

export PATH
EOF
}

package_csky-linux-gnuabiv2-tools-bin() {
    pkgdesc="C-Sky linux gnuabiv2 tools for 800 series"
    install -dm0755 "${pkgdir}/opt/t-head/${pkgname%-bin}"

    tar -xf "${srcdir}/${pkgname}-${pkgver}.tar.gz" -C "${pkgdir}/opt/t-head/${pkgname%-bin}" --no-same-owner  --no-same-permissions

    install -Dm0755 /dev/stdin "${pkgdir}/etc/profile.d/${pkgname%-bin}.sh" << EOF
#!/bin/sh
[ -d /opt/t-head/${pkgname%-bin}/bin ] && append_path '/opt/t-head/${pkgname%-bin}/bin'

export PATH
EOF
}

package_csky-elf-tools-bin() {
    pkgdesc="C-Sky elf tools for 800 series"
    install -dm0755 "${pkgdir}/opt/t-head/${pkgname%-bin}"

    tar -xf "${srcdir}/${pkgname}-${pkgver}.tar.gz" -C "${pkgdir}/opt/t-head/${pkgname%-bin}" --no-same-owner  --no-same-permissions

    install -Dm0755 /dev/stdin "${pkgdir}/etc/profile.d/${pkgname%-bin}.sh" << EOF
#!/bin/sh
[ -d /opt/t-head/${pkgname%-bin}/bin ] && append_path '/opt/t-head/${pkgname%-bin}/bin'

export PATH
EOF
}

package_csky-toolchain-guide-bin() {
    pkgdesc="C-Sky toolchain guide for 800 series"
    install -dm0755 "${pkgdir}/opt/t-head/${pkgname%-bin}"

    cp -r "${srcdir}"/*.pdf "${pkgdir}/opt/t-head/${pkgname%-bin}"
}
# vim: ts=4 sw=4 et
