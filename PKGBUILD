# Maintainer: Nils Kvist <robstenklippa@gmail.com>
# Contributor: Nils Kvist <robstenklippa@gmail.com>

pkgname=mondo-generator
pkgver=2019.01.16.1
pkgrel=1
pkgdesc='a theme template manager and generator'
arch=('any')
url='https://github.com/budlabs/mondo'
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
source=("https://github.com/budlabs/mondo/archive/$pkgver.tar.gz")
noextract=()
sha256sums=('35b57fcf2f171673895288c34b90cd434eb341bcb4cbd833418146c232360648')

package() {
  ls
  cd "mondo-$pkgver"

  make DESTDIR="$pkgdir/" PREFIX=/usr install

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
}
