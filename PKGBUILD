# Maintainer: Dave Blair <mail@dave-blair.de>
# Contributor:
# Contributor:

pkgname='minitube-aur'
pkgver='2.6'
pkgrel='3'
pkgdesc='A youtube client that does not need flash'
conflicts=('minitube')
arch=('x86_64')
url='http://flavio.tordini.org/minitube'
license=('gpl3')
install=${pkgname}.install
depends=('phonon-qt5'
	 'qt5-declarative'
	 'hicolor-icon-theme')
source=("http://flavio.tordini.org/files/minitube/minitube.deb")
md5sums=('SKIP')

prepare() {
  cd "$srcdir"
  msg2 'Extracting data from debian package'
  bsdtar -xf data.tar.xz -C .
}

package() {
  cd "$srcdir"
  msg2 "Packaging..."
  mv usr ${pkgdir/usr}
}
