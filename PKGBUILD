# Maintainer: To Be Assigned <youremail@domain.com>
pkgname=pipes.sh
pkgver=1.3.0
pkgrel=1
pkgdesc='Animated pipes terminal screensaver'
arch=('any')
url='https://github.com/pipeseroni/pipes.sh'
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
source=("https://github.com/pipeseroni/$pkgname/archive/v$pkgver.tar.gz")
noextract=()
sha256sums=('532976dd8dc2d98330c45a8bcb6d7dc19e0b0e30bba8872dcce352361655a426')

package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" PREFIX=/usr install

  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" LICENSE
  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.rst
}
