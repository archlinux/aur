# Maintainer: Sintan Santorum <c1scu0hh at anonaddy dot me>
pkgname="chhoto-url-cli-bin"
_pkgname="chhoto"
pkgver=0.2.0
pkgrel=1
pkgdesc="A CLI tool to be used to interact with Chhoto URL."
arch=('x86_64')
url="https://github.com/SinTan1729/$_pkgname-url-cli"
license=('MIT')
provides=('chhoto')
source=("$_pkgname-$pkgver.tar.gz::$url/releases/download/$pkgver/$_pkgname.tar.gz")
b2sums=('99d76fc478aab8e03941c16e720333749d67642e7f3b9996af66119ca46b4bff43bff015bbae9e72af8a1795f2723557989932bee6a33cd641b1fd0833d36b53')
package() {
	# binary
	install -Dm755 ./$_pkgname "$pkgdir/usr/bin/$_pkgname"
	# manpage
	install -Dm644 ./$_pkgname.1 "$pkgdir/usr/share/man/man1/$_pkgname.1"
}
