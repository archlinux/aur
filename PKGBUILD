# Maintainer: TingPing <tingping@tingping.se>

pkgname=fpaste
pkgver=0.3.9.2
pkgrel=1
pkgdesc='A cli frontend for the fpaste.org pastebin'
arch=('any')
url='http://fpaste.org/'
license=('GPL3')
depends=('python')
source=("https://releases.pagure.org/fpaste/$pkgname-$pkgver.tar.gz")

package() {
	cd "$pkgname-$pkgver"
	install -D -m755 'fpaste' "$pkgdir/usr/bin/fpaste"
	install -D -m644 'docs/man/en/fpaste.1' "$pkgdir/usr/share/man/man1/fpaste.1"
}

sha256sums=('02ea176b45baa856c073a3544f32bbf7683d5e2d16422e64ad75c0fbd9d42198')
