# Maintainer: TingPing <tingping@tingping.se>

pkgname=fpaste
pkgver=0.3.9.0
pkgrel=1
pkgdesc='A cli frontend for the fpaste.org pastebin'
arch=('any')
url='http://fpaste.org/'
license=('GPL3')
depends=('python')
source=("https://releases.pagure.org/fpaste/$pkgname-$pkgver.tar.gz")
sha256sums=('785cbf8d0db96127051151f442c3cfb97bd97aed8d27a8300c7a2d67e0a7d1d1')

package() {
	cd "$pkgname-$pkgver"
	install -D -m755 'fpaste' "$pkgdir/usr/bin/fpaste"
	install -D -m644 'docs/man/en/fpaste.1' "$pkgdir/usr/share/man/man1/fpaste.1"
}
