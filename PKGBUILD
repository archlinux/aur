# Maintainer: Nils Kvist <robstenklippa@gmail.com>
# Contributor: Nils Kvist <robstenklippa@gmail.com>

pkgname=polify
pkgver=2019.08.05.7
pkgrel=1
pkgdesc='polybar hookmodule manager'
arch=('any')
url='https://github.com/budlabs/polify'
license=('MIT')
groups=()
depends=('bash>=4.0.0')
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/budlabs/polify/archive/$pkgver.tar.gz")
noextract=()
sha256sums=('543ad3a1540881a87464ad1d4fceae4b2d88c09eeb3f0813ca41ffe94dfe0bf4')

package() {
  ls
  cd "polify-$pkgver"

  make DESTDIR="$pkgdir/" PREFIX=/usr install

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
}
