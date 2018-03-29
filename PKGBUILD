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
md5sums=('45bc7a89750c3c9ceacd33794173ca99')

package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" PREFIX=/usr install

  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" LICENSE
  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.rst
}
