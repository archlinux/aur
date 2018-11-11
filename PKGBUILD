#

pkgname=neru-icon-classic-theme
pkgver=2.3
pkgrel=1
pkgdesc="Classic theme icons Neru"
arch=('any')
url="https://github.com/chistota/neru-icon-classic-theme"
license=('LGPLv3')
depends=()
replaces=('neru-icon-classic-theme')
conflicts=()
source=("https://github.com/chistota/"${pkgname}"/archive/v"${pkgver}".tar.gz")
sha256sums=('cd4db2d06c90355a3c1da834e0d8740ff8901569f8a8a44cf7f72f27380b61c2')

package() {

tar -xzf v${pkgver}.tar.gz -C ${srcdir}
	cd "$srcdir"/"${pkgname}-${pkgver}"
	install -d "$pkgdir/usr/share/icons"
	install -d "$pkgdir/usr/share/doc/${pkgname}"
	install -d "$pkgdir/usr/share/licenses/${pkgname}"
cp -r {'neru-classic-light','neru-classic-dark','neru-classic-light-green','neru-classic-dark-green','neru-classic-light-yellow','neru-classic-dark-yellow'} "$pkgdir"/usr/share/icons/
	cp -r LICENSE "$pkgdir"/usr/share/licenses/"${pkgname}"/
	cp -r {README.md,AUTHORS} "$pkgdir"/usr/share/doc/"${pkgname}"/

}
