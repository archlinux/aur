pkgname="equilux-theme"
pkgver=20180110
pkgrel=1
pkgdesc="A couple of full-dark, neutral-gray themes (for GTK2, GTK3, Shell, and GDM) using the Equilux palette."
arch=('any')
url="https://github.com/ddnexus/equilux-theme"
license=('GPL')
source=("https://dl.opendesktop.org/api/files/downloadfile/id/1515545331/s/a5e56f0a2f226449004dce9760e995e5/t/1517026941/u//equilux-theme-v${pkgver}.tar.xz")
sha256sums=('52cea4e064a55b1bc0ed64c36b2cbc38e58a25227684c4f1f97e05bdcded1644')

package() {
	cd ${pkgname}-v${pkgver}
	install -d -m 755 ${pkgdir}/usr/share/themes/
	cp -r {Equilux,Equilux-compact} "${pkgdir}/usr/share/themes/"
}

