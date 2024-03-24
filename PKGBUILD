# Maintainer: Jax Young <jaxvanyang@gmail.com>
# Maintainer: Murli Tawari <kraanzu@gmail.com>

_pkgname=smassh
pkgname="$_pkgname-bin"
pkgver=3.1.2
pkgrel=1
pkgdesc="TUI based typing test application inspired by MonkeyType"
url="https://github.com/kraanzu/smassh"
arch=('x86_64')
license=('GPL-3.0-only')
depends=('zlib')
provides=('smassh')
conflicts=('smassh')
_binary="$_pkgname-$pkgver"
source=("$_binary::${url}/releases/download/v${pkgver}/linux-$_pkgname")
sha256sums=('251576c3dc9ae25daf8df9541104bb98152284c6c3320d05112b54364abaf0e8')

package() {
    install -Dm0755 "$_binary" "$pkgdir/usr/bin/$_pkgname"
}
