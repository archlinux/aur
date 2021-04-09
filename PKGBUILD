# Maintainer: Sam A. Horvath-Hunt <hello@samhh.com>

pkgname=bangin
pkgver=0.2.0
pkgrel=2
pkgdesc="A primitive, portable shell script which enables DuckDuckGo-like bangs"
url="https://git.sr.ht/~samhh/bangin"
arch=('any')
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('95263a2d8d34f6460e89de435f7ca22f65d07a661e631b4658b2c2778ec0b10c')

package() {
	cd "$pkgname-$pkgver"
	install -Dm 755 ./bangin.sh "$pkgdir/usr/bin/$pkgname"
	install -Dm 644 ./bangin.1 "$pkgdir/usr/share/man/man1/$pkgname.1"
	install -Dm 644 ./LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

