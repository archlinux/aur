pkgname=snallygaster
pkgver=0.0.10
pkgrel=1
pkgdesc="Tool to scan for secret files on HTTP servers"
url="https://github.com/hannob/snallygaster"
arch=('any')
license=('GPL2')
depends=("python-urllib3" "python-beautifulsoup4" "python-dnspython")
source=("$pkgname-$pkgver.tar.gz::https://github.com/hannob/snallygaster/archive/refs/tags/v$pkgver.tar.gz")
md5sums=('448dfcb9fa2cf177a037d40ffc1caa1b')

package() {
    install -Dm755 "$srcdir/snallygaster-$pkgver/snallygaster" "$pkgdir/usr/bin/snallygaster"
	install -Dm644 "$srcdir/snallygaster-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/snallygaster/LICENSE"
    install -Dm755 "$srcdir/snallygaster-$pkgver/TESTS.md" "$pkgdir/usr/share/doc/snallygaster/TESTS.md"
}
