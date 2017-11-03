pkgname="equilux-theme"
pkgver=20171030
pkgrel=1
pkgdesc="A couple of full-dark, neutral-gray themes (for GTK2, GTK3, Shell, and GDM) using the Equilux palette."
arch=('any')
url="https://github.com/ddnexus/equilux-theme"
license=('GPL')
source=("https://github.com/ddnexus/equilux-theme/releases/download/equilux-v20171030/equilux-theme-v${pkgver}.tar.xz")
sha256sums=('2477e109ae32ede9059a33c0ddb6ba7c703e8c963c9fa6e70ff358dd790cf518')

package() {
	cd ${pkgname}-v${pkgver}
	install -d -m 755 ${pkgdir}/usr/share/themes/
	cp -r {Equilux,Equilux-compact} "${pkgdir}/usr/share/themes/"
}

