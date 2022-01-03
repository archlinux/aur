# Maintainer: Csonka Mihaly <csonka.mihaly@hotmail.com>

pkgname='rustpad-bin'
pkgdesc='Multi-threaded Padding Oracle attacks against any service.'
pkgver='1.7.0'
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
sha256sums=('ff13fc312379292bcefcc44ccae67658ea07354082e994148431bf71959a4c91')

package() {
    install -Dm755 "rustpad" "$pkgdir/usr/bin/rustpad"
}
