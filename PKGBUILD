# Maintainer: Isabella Basso do Amaral <isabbasso at riseup dot net>

pkgname=fpaste
pkgver=0.4.2.0
pkgrel=1
pkgdesc='A cli frontend for the fpaste.org pastebin'
arch=('any')
url='https://pagure.io/fpaste'
license=('GPL3')
depends=('python')
source=("https://pagure.io/fpaste/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")

sha256sums=('ed7d090b924c169a510772e026a80f224074716acdfa7baa6bb5f624e8800d27')

package() {
	cd "$pkgname-$pkgver"
	install -D -m755 'fpaste' "$pkgdir/usr/bin/fpaste"
	install -D -m644 'docs/man/en/fpaste.1' "$pkgdir/usr/share/man/man1/fpaste.1"
}
