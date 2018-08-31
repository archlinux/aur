# Maintainer: Nils Kvist <robstenklippa@gmail.com>
# Contributor: Nils Kvist <robstenklippa@gmail.com>

pkgname=mondo-generator
pkgver=0.1.3
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
source=("https://github.com/budlabs/mondo/archive/v.$pkgver.tar.gz")
noextract=()
sha256sums=('847f6ea4978ac48ded24a8dd356278a21a934dbf6100180dc2823d19f8d7a63c')

package() {
  cd "mondo-v.$pkgver"

  make DESTDIR="$pkgdir/" PREFIX=/usr install

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
}
