# Maintainer: Geballin - Guillaume Ballin <macniaque at free dot fr>
pkgname=tcl-combobox
pkgver=2.3
pkgrel=3
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
source=("https://github.com/Geballin/tcl-combobox/archive/refs/tags/v${pkgver}.zip")

md5sums=(4c382716035747036cd630cf4b474ae5)

package() {
  mkdir -p ${pkgdir}/usr/lib/
  cp -rfp ${srcdir}/${pkgname}-${pkgver} ${pkgdir}/usr/lib/
}
