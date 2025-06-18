# Maintainer: Sintan Santorum <c1scu0hh at anonaddy dot me>
pkgname="chhoto-url-cli-bin"
_pkgname="chhoto"
pkgver=0.1.0
pkgrel=1
pkgdesc="A CLI tool to be used to interact with Chhoto URL."
arch=('x86_64')
url="https://github.com/SinTan1729/$_pkgname-url-cli"
license=('MIT')
provides=('chhoto')
source=("$_pkgname-$pkgver.tar.gz::$url/releases/download/$pkgver/$_pkgname.tar.gz")
b2sums=('487b3d9ff5093c713dda14e07cac1436753606a4f34431d3045d04de104314c8d49cf2a3930c37757f2e1823f89a42f6604ac179852cff5aba2562decdeecddb')
package() {
	# binary
	install -Dm755 ./$_pkgname "$pkgdir/usr/bin/$_pkgname"
	# manpage
	install -Dm644 ./$_pkgname.1 "$pkgdir/usr/share/man/man1/$_pkgname.1"
}
