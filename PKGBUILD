# Maintainer: Csonka Mihaly <csonka.mihaly@hotmail.com>

pkgname='rustpad-bin'
pkgdesc='Multi-threaded Padding Oracle attacks against any service.'
pkgver='1.0.1'
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
sha256sums=('a823565769b8a3cd15d6239c8bd7956047166532fbfe2cc6ee35ad28e4ee3960')

package() {
    install -Dm755 "rustpad" "$pkgdir/usr/bin/rustpad"
}
