# Maintainer: Benoit Favre <benoit.favre@lif.univ-mrs.fr>
pkgname=macaviz
pkgver=1.0.1
pkgrel=1
pkgdesc="Graphical frontend for macaon NLP tools"
arch=(i686 x86_64)
url="http://macaon.lif.univ-mrs.fr/"
license=('GPL')
groups=()
depends=(macaon graphviz gtkmm)
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=($url/uploads/macaon/packages/maca_view/$pkgname-$pkgver.tar.gz)
noextract=()
md5sums=(f61ca97644c95044916c4e64d0f4a70e) #generate with 'makepkg -g'

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
