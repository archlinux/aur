# Maintainer: Sintan Santorum <c1scu0hh at anonaddy dot me>
pkgname="chhoto-url-cli-bin"
_pkgname="chhoto"
pkgver=0.4.3
pkgrel=1
pkgdesc="A CLI tool to be used to interact with Chhoto URL."
arch=('x86_64')
url="https://github.com/SinTan1729/$_pkgname-url-cli"
license=('MIT')
provides=('chhoto')
source=("$_pkgname-$pkgver.tar.gz::$url/releases/download/$pkgver/$_pkgname.tar.gz")
b2sums=('136a89ef1de376cf3bdaffb731ad6ec67233535ce1b88ef622310f89126875d4e8b43ecc909d5bc1d67201931e25249c49dc0735a44442ef9720fb74646f9424')
package() {
	# binary
	install -Dm755 ./$_pkgname "$pkgdir/usr/bin/$_pkgname"
	# manpage
	install -Dm644 ./$_pkgname.1 "$pkgdir/usr/share/man/man1/$_pkgname.1"
}
