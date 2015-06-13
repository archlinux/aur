# Contributor: Spyros Stathopoulos <foucault.online@gmail.com>
pkgname=tksqlite
pkgver=0.5.11
pkgrel=1
pkgdesc="TkSQLite is a GUI database manager for SQLite implemented by Tcl/Tk."
arch=('i686' 'x86_64') 
url="http://reddog.s35.xrea.com/wiki/TkSQLite.html"
license=('BSD')
depends=('tcl>=8.5.0' 'tk>=8.5.0' 'tktable>=2.9' 'tktreectrl>=2.1' 'sqlite-tcl')
optdepends=('tkimg: for reading image data' 
            'tcltrf: for crypt functions' 
            'tcllib: for crypt functions')
source=("http://reddog.s35.xrea.com/software/${pkgname}-${pkgver}.tar.gz")
md5sums=('cd861d386fbacc94dd473ebe51815ea0')

build() {
  cd "$srcdir"
  # Just fix the file name
  mv "${pkgname}.tcl" "${pkgname}"
}

package() {
  install -D -m755 ${pkgname} ${pkgdir}/usr/bin/${pkgname}
}

# vim:set ts=2 sw=2 et:
