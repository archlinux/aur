# Maintainer: Thomas Gubler <thomasgubler@gmail.com>
pkgname=blabel
pkgver=0.07
pkgrel=1
pkgdesc="A Linux labeling program for Brother P-touch series"
arch=('any')
url="http://apz.fi/blabel/"
license=('PerlArtistic')
groups=('office')
depends=('gtk2-perl' 'glade-perl' 'perl-gd' 'cups')
makedepends=()
optdepends=()
provides=('blabel')
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(http://apz.fi/$pkgname/$pkgname${pkgver//[.]/}.tar.bz2)
noextract=()
md5sums=('ded452437b9aab798bac6c7a9b99abd8')

build() {
	echo "Nothing to build"
}

package() {
  cd "$srcdir/$pkgname"

  mkdir -p "${pkgdir}/usr/bin/"
  mkdir -p "${pkgdir}/usr/share/pixmaps/"
  mkdir -p "${pkgdir}/usr/share/applications/"
  mkdir -p "${pkgdir}/usr/share/$pkgname"
  mkdir -p "${pkgdir}/usr/share/man/man1"

  cp blabel "${pkgdir}/usr/bin/"
  cp blabel.png "${pkgdir}/usr/share/pixmaps/"
  cp blabel.desktop "${pkgdir}/usr/share/applications/"
  cp "blabel.glade" "${pkgdir}/usr/share/$pkgname"
  cp man/man1/blabel.1.gz "${pkgdir}/usr/share/man/man1"
}
