# Maintainer: Sefa Eyeoglu <contact@scrumplex.net>

_pkgname=proji
pkgname=${_pkgname}-bin
pkgver=0.20.0
pkgrel=2
pkgdesc="A powerful cross-platform CLI project templating tool"
arch=("x86_64")
url="https://github.com/nikoksr/proji"
license=("custom:MIT")
depends=("glibc")
provides=($_pkgname)
conflicts=($_pkgname)
install="${pkgname}.install"
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/nikoksr/proji/releases/download/v${pkgver}/proji_Linux_64bit.tar.gz")
sha512sums=('bca137f064686fe5589ed843051f3691cfea45602c7ccc961358e729e82f52fbb76f8eca0e31c47b4b8516b90935d65d348ddb187b2cbb85066a4a15970c4e99')

package() {
    install -Dm755 "proji" "${pkgdir}/usr/bin/proji"

    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
