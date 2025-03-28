# Maintainer: walldmtd <walldmtd at proton dot me>

pkgname=vimix-kanagawa-cursors
pkgver=2.0.0
pkgrel=1
pkgdesc="Kanagawa recolour of the Vimix cursor theme by vinceliuice"
arch=(any)
url="https://github.com/walldmtd/vimix-kanagawa-cursors"
license=("GPL-3.0-or-later")
source=("${pkgname}-wave-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${pkgname}-wave.tar.gz"
        "${pkgname}-lotus-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${pkgname}-lotus.tar.gz")
b2sums=('8a4f07152f61fa6633b6ab1059a11a20d78716429b4b475106ac4fdfa82c7be8d12ceab353af47c8a89cfe3015b4efbe342cd0ac87f3d4ea635fce37ba70fb98'
        'b81dcf9c603a9f68d86f3e974ec6d86a0c7d2fe42b402e55d07de82ccb18b6dfb4e32605bc89f92b7897eeedc1bc3f7ad4698475ac2b7e2b1a6eb3a34eba281c')

package() {
    install -d "${pkgdir}"/usr/share/icons/{"${pkgname}-wave","${pkgname}-lotus"}
    cp -dr --no-preserve=ownership "${pkgname}-wave"/* "${pkgdir}/usr/share/icons/${pkgname}-wave"
    cp -dr --no-preserve=ownership "${pkgname}-lotus"/* "${pkgdir}/usr/share/icons/${pkgname}-lotus"
}
