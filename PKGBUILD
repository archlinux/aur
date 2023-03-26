# Maintainer: Sam A. Horvath-Hunt <hello@samhh.com>

pkgname=bangin
pkgver=0.2.1
pkgrel=2
pkgdesc="A primitive, portable shell script which enables DuckDuckGo-like bangs"
url="https://git.sr.ht/~samhh/bangin"
arch=('any')
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('2abee64f5f3956592168d1378c066a4bbe71449ac3005c005e8b9404ea364689')

package() {
	cd "$pkgname-$pkgver"
	install -Dm 755 ./bangin.sh "$pkgdir/usr/bin/$pkgname"
	install -Dm 644 ./bangin.1 "$pkgdir/usr/share/man/man1/$pkgname.1"
	install -Dm 644 ./LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

