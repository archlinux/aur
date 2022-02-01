# Maintainer: Csonka Mihaly <csonka.mihaly@hotmail.com>

pkgname='rustpad-bin'
pkgdesc='Multi-threaded Padding Oracle attacks against any service.'
pkgver='1.8.0'
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
sha256sums=('a0280752c3eeab5b60f7bf9caf361448efb86af4bef19d2a4052697a370eee35')

package() {
    install -Dm755 "rustpad" "$pkgdir/usr/bin/rustpad"
}
