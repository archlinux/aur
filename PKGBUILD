# Maintainer: Philip Goto <philip.goto@gmail.com>
pkgname=flutter
pkgver=alpha
pkgrel=1
pkgdesc="Flutter is a new mobile app SDK to help developers and designers build modern mobile apps for iOS and Android."
arch=('any')
url="https://flutter.io/"
license=('https://github.com/flutter/flutter/blob/master/LICENSE')
provides=('flutter')
source=("flutter")
sha256sums=('SKIP')

package() {
    install -dm 755 "${pkgdir}/usr/bin"
    install -m 755 "flutter" "${pkgdir}/usr/bin"
}
