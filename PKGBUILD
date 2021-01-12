# Maintainer: Pierre Dommerc <dommerc.pierre@gmail.com>

pkgname=baru-bin
_pkgname=baru
pkgver=0.2.4
pkgrel=1
pkgdesc="A system monitor written in Rust and C"
arch=('x86_64')
url="https://github.com/doums/baru"
license=('MPL2')
source=("$pkgname-$pkgver::https://github.com/doums/baru/releases/download/v${pkgver}/${_pkgname}")
depends=('libpulse' 'libnl')
md5sums=('6e56a2ab2fb62cc74d47e54caf85f0ad')

package() {
  install -Dm755 "$pkgname-$pkgver" "$pkgdir/usr/bin/$_pkgname"
}
