# Maintainer: Sam A. Horvath-Hunt <hello@samhh.com>

pkgname=bangin
pkgver=0.1.1
pkgrel=1
pkgdesc="A primitive, portable shell script which enables DuckDuckGo-like bangs"
url="https://github.com/samhh/bangin/"
arch=('any')
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::https://github.com/samhh/bangin/archive/$pkgver.tar.gz")
md5sums=('2992338d8e6fb99dfcb8996140a266c6')

package() {
	cd "$pkgname-$pkgver"
	install -Dm 755 ./bangin.sh "$pkgdir/usr/bin/$pkgname"
	install -Dm 644 ./LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

