# Maintainer: Geballin - Guillaume Ballin <macniaque at free dot fr>
pkgname=tcl-combobox
pkgver=2.3
pkgrel=2
pkgdesc="A combobox megawidget for TK written in pure TCL"
url="https://core.tcl-lang.org/jenglish/gutter/packages/combobox.html"
arch=('x86_64' 'i686')
license=('BSD')
depends=('tcl' 'tk' 'tk-itk')
optdepends=()
makedepends=(make gcc)
conflicts=()
replaces=()
backup=()
install=
source=("http://tcltk.co.kr/files/combobox-${pkgver}.zip")

md5sums=(36e76912017d54481ac9567ab4abada6)

package() {
  mkdir -p ${pkgdir}/usr/lib/
  cp -rfp ${srcdir}/combobox-${pkgver} ${pkgdir}/usr/lib/
}
