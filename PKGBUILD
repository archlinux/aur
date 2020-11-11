# Maintainer: Pierre Dommerc <dommerc.pierre@gmail.com>

pkgname=baru-bin
_pkgname=baru
pkgver=0.2.1
pkgrel=1
pkgdesc="A system monitor written in Rust and C"
arch=('x86_64')
url="https://github.com/doums/baru"
license=('MPL2')
source=("$pkgname-$pkgver::https://github.com/doums/baru/releases/download/v${pkgver}/${_pkgname}")
depends=('libpulse' 'libnl')
md5sums=('d67942924373497a5096d4700ccc688a')

package() {
  install -Dm755 "$pkgname-$pkgver" "$pkgdir/usr/bin/$_pkgname"
}
