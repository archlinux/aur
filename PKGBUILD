# Maintainer: Pierre Dommerc <dommerc.pierre@gmail.com>

pkgname=baru-bin
_pkgname=baru
pkgver=0.2.2
pkgrel=1
pkgdesc="A system monitor written in Rust and C"
arch=('x86_64')
url="https://github.com/doums/baru"
license=('MPL2')
source=("$pkgname-$pkgver::https://github.com/doums/baru/releases/download/v${pkgver}/${_pkgname}")
depends=('libpulse' 'libnl')
md5sums=('10b79d01f245dc669699120fb66cf0a9')

package() {
  install -Dm755 "$pkgname-$pkgver" "$pkgdir/usr/bin/$_pkgname"
}
