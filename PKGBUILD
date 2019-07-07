pkgname="equilux-theme"
pkgver=20181029
pkgrel=2
pkgdesc="A couple of full-dark, neutral-gray themes (for GTK2, GTK3, Shell, and GDM) using the Equilux palette."
arch=('any')
url="https://github.com/ddnexus/equilux-theme"
license=('GPL')
source=("https://github.com/ddnexus/equilux-theme/archive/equilux-v$pkgver.zip")
sha256sums=('acfb05cf01dd83213ad06c7e228eea00e9fe5f86e73993c3c23b2ac5f56d2a3b')
makedepends=('bc')

package() {
	cd equilux-theme-equilux-v${pkgver}
	export destdir="$pkgdir/"
	mkdir -p "${pkgdir}/usr/share/themes"
	./install.sh -d "${pkgdir}/usr/share/themes"
}
