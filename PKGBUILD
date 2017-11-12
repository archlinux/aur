pkgname="equilux-theme"
pkgver=20171110
pkgrel=1
pkgdesc="A couple of full-dark, neutral-gray themes (for GTK2, GTK3, Shell, and GDM) using the Equilux palette."
arch=('any')
url="https://github.com/ddnexus/equilux-theme"
license=('GPL')
source=("https://github.com/ddnexus/equilux-theme/releases/download/equilux-v${pkgver}/equilux-theme-v${pkgver}.tar.xz")
sha256sums=('ddc00f9fbd956916c90d28deb0208791949e1f28a668a42af1913c269ad98586')

package() {
	cd ${pkgname}-v${pkgver}
	install -d -m 755 ${pkgdir}/usr/share/themes/
	cp -r {Equilux,Equilux-compact} "${pkgdir}/usr/share/themes/"
}

