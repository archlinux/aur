# Maintainer: Sintan Santorum <c1scu0hh at anonaddy dot me>
pkgname="chhoto-url-cli-bin"
_pkgname="chhoto"
pkgver=0.4.2
pkgrel=1
pkgdesc="A CLI tool to be used to interact with Chhoto URL."
arch=('x86_64')
url="https://github.com/SinTan1729/$_pkgname-url-cli"
license=('MIT')
provides=('chhoto')
source=("$_pkgname-$pkgver.tar.gz::$url/releases/download/$pkgver/$_pkgname.tar.gz")
b2sums=('fe7c53073f2f31d27ee8f53e9d28507ff92fb211b52decaa507b157dfeaa1a53fc966b9fa010c77aa1ecb027ecd6a2bea4cd259ffdfe6d86cc628a05f990b510')
package() {
	# binary
	install -Dm755 ./$_pkgname "$pkgdir/usr/bin/$_pkgname"
	# manpage
	install -Dm644 ./$_pkgname.1 "$pkgdir/usr/share/man/man1/$_pkgname.1"
}
