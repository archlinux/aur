# Maintainer: Geballin - Guillaume Ballin <macniaque at free dot fr>
pkgname=robodoc
pkgver=4.99.44
pkgrel=1
pkgdesc="ROBODoc is program documentation tool. It works with many programming languages: For instance C, Pascal, Shell Scripts, Assembler, COBOL, Occam, Postscript, Forth, Tcl/Tk, C++, Java -- basically any program in which you can use remarks/comments."
url="https://rfsber.home.xs4all.nl/Robo/"
arch=('x86_64' 'i686')
license=('GPLv3')
depends=()
optdepends=()
makedepends=(gcc make)
conflicts=()
replaces=()
backup=()
install=
source=("http://rfsber.home.xs4all.nl/Robo/archives/robodoc-${pkgver}.tar.gz")

md5sums=('ad983c18379800859158b0fedc8378f3')

build() {
  tar xzf robodoc-${pkgver}.tar.gz
  cd robodoc-${pkgver}
  ./configure --prefix=/usr
  make
  }

package() {
  cd robodoc-${pkgver}
  make DESTDIR="${pkgdir}" install
  }
