# Maintainer: Pierre Dommerc <dommerc.pierre@gmail.com>

pkgname=baru-bin
_pkgname=baru
pkgver=0.2.6
pkgrel=1
pkgdesc="A system monitor written in Rust and C"
arch=('x86_64')
url="https://github.com/doums/baru"
license=('MPL2')
source=("$pkgname-$pkgver::https://github.com/doums/baru/releases/download/v${pkgver}/${_pkgname}")
depends=('libpulse' 'libnl')
provides=("$_pkgname")
conflicts=("$_pkgname")
md5sums=('3025f3e7da1ee02e97cd483b4fa8ba04')

package() {
  install -Dm755 "$pkgname-$pkgver" "$pkgdir/usr/bin/$_pkgname"
}
