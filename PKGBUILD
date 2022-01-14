# Maintainer: Csonka Mihaly <csonka.mihaly@hotmail.com>

pkgname='rustpad-bin'
pkgdesc='Multi-threaded Padding Oracle attacks against any service.'
pkgver='1.7.3'
pkgrel='1'
arch=('x86_64')
url='https://github.com/Kibouo/rustpad/'
license=('GPL-3.0')
depends=()
optdepends=()
makedepends=()
checkdepends=()
provides=('rustpad')
conflicts=('rustpad')
source=("${url}releases/download/v${pkgver}/rustpad")
sha256sums=('8f1fefd7827d18893027d2bc953db587387ce9dbb27e31d4491654efc385a356')

package() {
    install -Dm755 "rustpad" "$pkgdir/usr/bin/rustpad"
}
