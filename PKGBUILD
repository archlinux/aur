# Maintainer: Jax Young <jaxvanyang@gmail.com>
# Maintainer: Murli Tawari <kraanzu@gmail.com>

_pkgname=smassh
pkgname="$_pkgname-bin"
pkgver=3.1.4
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
sha256sums=('30e22bdd31cad2fd4a7c02e62aba09d7851df4dd68ba607f08ba5d81266dc054')

package() {
    install -Dm0755 "$_binary" "$pkgdir/usr/bin/$_pkgname"
}
