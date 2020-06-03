# Maintainer: Nils Kvist <robstenklippa@gmail.com>
# Contributor: Nils Kvist <robstenklippa@gmail.com>

pkgname=polify
pkgver=2020.06.03.1
pkgrel=1
pkgdesc='polybar hookmodule manager'
arch=('any')
url='https://github.com/budlabs/polify'
license=('MIT')
groups=()
depends=('bash>=4.0.0')
makedepends=()
optdepends=('polybar')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/budlabs/polify/archive/$pkgver.tar.gz")
noextract=()
sha256sums=('9c249be3b85e52d2169f60a846ff85e35bcea535a3d5db643d77e735019df349')

package() {
  ls
  cd "polify-$pkgver"

  make DESTDIR="$pkgdir/" PREFIX=/usr install

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
}
