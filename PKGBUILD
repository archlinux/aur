# Maintainer: Christopher Loen <christopherloen at gmail dot com>
pkgname=bsqlbf
pkgver=2.7
pkgrel=1
pkgdesc="Blind SQL Injection bruteforcer"
arch=(any)
url="https://code.google.com/archive/p/bsqlbf-v2/"
license=('BSD3')
depends=(perl)
source=("https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/bsqlbf-v2/bsqlbf-v2-7.pl")
md5sums=(e8ff26d71a588523ef46d5b85d440883)

package() {
	cd "$srcdir"
	install -dm755 "$pkgdir"/usr/bin/
        cp bsqlbf-v2-7.pl "$pkgdir"/usr/bin/"$pkgname"
        chmod +x "$pkgdir"/usr/bin/"$pkgname"
}
