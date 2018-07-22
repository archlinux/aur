# Maintainer: TingPing <tingping@tingping.se>

pkgname=fpaste
pkgver=0.3.9.1
pkgrel=1
pkgdesc='A cli frontend for the fpaste.org pastebin'
arch=('any')
url='http://fpaste.org/'
license=('GPL3')
depends=('python')
source=("https://releases.pagure.org/fpaste/$pkgname-$pkgver.tar.gz")
sha256sums=('7623b69fa26b3d8d69de987a2bd03b5834329ce35aff15ddee3782538f575c4a')

package() {
	cd "$pkgname-$pkgver"
	install -D -m755 'fpaste' "$pkgdir/usr/bin/fpaste"
	install -D -m644 'docs/man/en/fpaste.1' "$pkgdir/usr/share/man/man1/fpaste.1"
}
