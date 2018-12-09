# Maintainer: basigur

pkgname=neru-icon-classic-theme
pkgver=2.4
pkgrel=1
pkgdesc="Classic theme icons Neru"
arch=('any')
url="https://github.com/chistota/neru-icon-classic-theme"
license=('LGPL3')
depends=()
replaces=('neru-icon-classic-theme')
conflicts=()
source=("https://github.com/chistota/"${pkgname}"/archive/v"${pkgver}".tar.gz")
sha512sums=('22F8E2AB6622082800C954D03409F9C5D018A4E309CFE9E315FE361383DAA0F04E577D31B7B45A085A167EBCC9D7F87CAA72C5EBD4428A62BDF1548C1BC54999')

package() {

	tar -xzf v${pkgver}.tar.gz
	cd "$srcdir"/"${pkgname}-${pkgver}"
	install -d "$pkgdir/usr/share/icons"
	install -d "$pkgdir/usr/share/doc/${pkgname}"
	install -d "$pkgdir/usr/share/licenses/${pkgname}"
cp -r {'neru-classic-light','neru-classic-dark','neru-classic-light-green','neru-classic-dark-green','neru-classic-light-yellow','neru-classic-dark-yellow'} "$pkgdir"/usr/share/icons/
	cp -r LICENSE "$pkgdir"/usr/share/licenses/"${pkgname}"/
	cp -r {README.md,AUTHORS} "$pkgdir"/usr/share/doc/"${pkgname}"/

}
