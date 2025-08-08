# Maintainer: Spyros Stathopoulos <spystath@gmail.com>
pkgname=tksqlite
pkgver=0.5.13
pkgrel=2
pkgdesc="TkSQLite is a GUI database manager for SQLite implemented by Tcl/Tk."
arch=("i686" "x86_64")
url="http://reddog.s35.xrea.com/wiki/TkSQLite.html"
license=("BSD-3-Clause")
depends=('tcl>=8.5.0' 'tk>=8.5.0' 'tktable>=2.9' 'tktreectrl' 'sqlite-tcl')
optdepends=('tkimg: for reading image data'
            'tcltrf: for crypt functions'
            'tcllib: for crypt functions')
source=("http://reddog.s35.xrea.com/software/${pkgname}-${pkgver}.tar.gz")
sha256sums=('c8807721474d2306e6765d1ffaf8d99950e423fe37065d2026978422a9ab7f0e')

build() {
  cd "$srcdir"
  # Just fix the file name
  mv "${pkgname}.tcl" "${pkgname}"
}

package() {
  install -D -m755 ${pkgname} ${pkgdir}/usr/bin/${pkgname}
}

# vim:set ts=2 sw=2 et:
