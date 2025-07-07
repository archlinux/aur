# Maintainer: Sintan Santorum <c1scu0hh at anonaddy dot me>
pkgname="chhoto-url-cli-bin"
_pkgname="chhoto"
pkgver=0.4.0
pkgrel=1
pkgdesc="A CLI tool to be used to interact with Chhoto URL."
arch=('x86_64')
url="https://github.com/SinTan1729/$_pkgname-url-cli"
license=('MIT')
provides=('chhoto')
source=("$_pkgname-$pkgver.tar.gz::$url/releases/download/$pkgver/$_pkgname.tar.gz")
b2sums=('ab20c818cffc9742054ac687ba35a227cf5797425a298577ce81d491251f02db569acca81200857719b307866ab0eb501c35d6cf0fb82404663352520dc9d465')
package() {
	# binary
	install -Dm755 ./$_pkgname "$pkgdir/usr/bin/$_pkgname"
	# manpage
	install -Dm644 ./$_pkgname.1 "$pkgdir/usr/share/man/man1/$_pkgname.1"
}
