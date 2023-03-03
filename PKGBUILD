# Maintainer: Csonka Mihaly <csonka.mihaly@hotmail.com>

pkgname='rustpad-bin'
pkgdesc='Multi-threaded Padding Oracle attacks against any service.'
pkgver='1.8.1'
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
sha256sums=('67bfd6e0447b7306eb73221d3a74b4d55634d539fd432e6b17bd4b23f1e775fb')

package() {
    install -Dm755 "rustpad" "$pkgdir/usr/bin/rustpad"
}
