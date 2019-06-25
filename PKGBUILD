# Maintainer: TingPing <tingping@tingping.se>

pkgname=fpaste
pkgver=0.3.9.2
pkgrel=2
pkgdesc='A cli frontend for the fpaste.org pastebin'
arch=('any')
url='https://pagure.io/fpaste'
license=('GPL3')
depends=('python')
source=("https://pagure.io/fpaste/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")

package() {
	cd "$pkgname-$pkgver"
	install -D -m755 'fpaste' "$pkgdir/usr/bin/fpaste"
	install -D -m644 'docs/man/en/fpaste.1' "$pkgdir/usr/share/man/man1/fpaste.1"
}

sha256sums=('f3209772af898d58df586dcf408eceb20d7d1ab42c8ed2689a4e0140e25c4052')
