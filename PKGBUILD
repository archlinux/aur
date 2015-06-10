# Maintainer: Hervé Quillévéré <http://www.rvq.fr/php/mailme.php>
pkgname=gaw
pkgver=20111016
pkgrel=1
epoch=
pkgdesc="Gtk analog waveform viewer - tool for viewing analog data, such as the output of Spice simulations"
arch=('i686' 'x86_64')
url="http://www.rvq.fr/linux/gaw.php"
license=('GPL')
groups=()
depends=('gtk2')
makedepends=()
checkdepends=()
optdepends=('alsa-lib')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(http://download.tuxfamily.org/gaw/download/$pkgname-$pkgver.tar.gz)
noextract=()
md5sums=('344bc70737f217451babf69f16a9196f') #generate with 'makepkg -g'

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
