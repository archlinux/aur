# Maintainer: Jax Young <jaxvanyang@gmail.com>
# Maintainer: Murli Tawari <kraanzu@gmail.com>

_pkgname=smassh
pkgname="$_pkgname-bin"
pkgver=3.2.1
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
sha256sums=('11e125df20e55e82c3d98948ab4d37feaea0267f2c26dc92fd11c549f0ee40e7')

package() {
    install -Dm0755 "$_binary" "$pkgdir/usr/bin/$_pkgname"
}
