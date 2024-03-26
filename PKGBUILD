# Maintainer: Jax Young <jaxvanyang@gmail.com>
# Maintainer: Murli Tawari <kraanzu@gmail.com>

_pkgname=smassh
pkgname="$_pkgname-bin"
pkgver=3.1.3
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
sha256sums=('3f8c84fed9c0205c5f052a025a422c9e8629d62590a308af657c3a89186f9c01')

package() {
    install -Dm0755 "$_binary" "$pkgdir/usr/bin/$_pkgname"
}
