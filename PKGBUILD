# Maintainer: Bruce Zhang
pkgname=sqlark-bin
pkgver=3.3
pkgrel=1
pkgdesc="SQLark is a powerful SQL query tool that provides a user-friendly interface for database management and analysis."
arch=('x86_64')
url="https://www.sqlark.com/"
license=('Commercial')
provides=('sqlark')
source=("https://download.sqlark.com/fullPackage/Linux/SQLark_V${pkgver}_linux_${arch}.tar.gz")
sha256sums=('79c40e71247a84a8eda1996556937a3488cf75351b1fd7dda6e169604ec5f393')

package() {
	mkdir -p "$pkgdir/opt"
	mkdir -p "$pkgdir/usr/bin"
	cp -r "$srcdir/sqlark$pkgver" "$pkgdir/opt/sqlark"
	ln -s "/opt/sqlark/sqlark" "$pkgdir/usr/bin/sqlark"
}
