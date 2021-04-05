# Maintainer: Sam A. Horvath-Hunt <hello@samhh.com>

pkgname=bangin
pkgver=0.1.2
pkgrel=1
pkgdesc="A primitive, portable shell script which enables DuckDuckGo-like bangs"
url="https://github.com/samhh/bangin/"
arch=('any')
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::https://github.com/samhh/bangin/archive/$pkgver.tar.gz")
sha256sums=('52855f85db1680e4c34a82bc18db1c64c7777e1f9cb6eafb9caabf4e6c700229')

package() {
	cd "$pkgname-$pkgver"
	install -Dm 755 ./bangin.sh "$pkgdir/usr/bin/$pkgname"
	install -Dm 644 ./bangin.1 "$pkgdir/usr/share/man/man1/$pkgname.1"
	install -Dm 644 ./LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

