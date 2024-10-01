# Maintainer: Jax Young <jaxvanyang@gmail.com>
# Maintainer: Murli Tawari <kraanzu@gmail.com>

_pkgname=smassh
pkgname="$_pkgname-bin"
pkgver=3.1.6
pkgrel=2
pkgdesc="TUI based typing test application inspired by MonkeyType"
url="https://github.com/kraanzu/smassh"
arch=('x86_64')
license=('GPL-3.0-only')
depends=('zlib')
provides=('smassh')
conflicts=('smassh')
_binary="$_pkgname-$pkgver"
source=("$_binary::${url}/releases/download/v${pkgver}/linux-$_pkgname")
sha256sums=('6b5ca506bb74ebc4a35bef7a32ac844317f6ac19a78ab777cd61748a9bc5b65c')

package() {
    install -Dm0755 "$_binary" "$pkgdir/usr/bin/$_pkgname"
}
