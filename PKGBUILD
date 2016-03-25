# Maintainer: TingPing <tingping@tingping.se>

pkgname=fpaste
pkgver=0.3.8.1
pkgrel=1
pkgdesc='A cli frontend for the fpaste.org pastebin'
arch=('any')
url='http://fpaste.org/'
license=('GPL3')
depends=('python')
source=("https://fedorahosted.org/released/fpaste/$pkgname-$pkgver.tar.gz")
sha256sums=('2cf565f2a803371b13292db8f243da5f49c0509eb2e89d6236b4096d74f161df')

package() {
	cd "$pkgname-$pkgver"
	install -D -m755 'fpaste' "$pkgdir/usr/bin/fpaste"
	install -D -m644 'docs/man/en/fpaste.1' "$pkgdir/usr/share/man/man1/fpaste.1"
}
