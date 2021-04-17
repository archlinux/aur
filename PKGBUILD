# Maintainer: TingPing <tingping@tingping.se>

pkgname=fpaste
pkgver=0.4.1.1
pkgrel=1
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

sha256sums=('ceae29cda16425d6f7eef0ae1301cb323425d7dc654b0c1b90c71d295c901266')
