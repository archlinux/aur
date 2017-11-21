pkgname="equilux-theme"
pkgver=20171120
pkgrel=1
pkgdesc="A couple of full-dark, neutral-gray themes (for GTK2, GTK3, Shell, and GDM) using the Equilux palette."
arch=('any')
url="https://github.com/ddnexus/equilux-theme"
license=('GPL')
source=("https://github.com/ddnexus/equilux-theme/releases/download/equilux-v${pkgver}/equilux-theme-v${pkgver}.tar.xz")
sha256sums=('1003880d079abdbbddd9b2c0a7d68efa38820b37e7372bfcab4322a5ff5e951c')

package() {
	cd ${pkgname}-v${pkgver}
	install -d -m 755 ${pkgdir}/usr/share/themes/
	cp -r {Equilux,Equilux-compact} "${pkgdir}/usr/share/themes/"
}

