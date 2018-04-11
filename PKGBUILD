pkgname="equilux-theme"
pkgver=20180406
pkgrel=1
pkgdesc="A couple of full-dark, neutral-gray themes (for GTK2, GTK3, Shell, and GDM) using the Equilux palette."
arch=('any')
url="https://github.com/ddnexus/equilux-theme"
license=('GPL')
source=("https://github.com/ddnexus/equilux-theme/archive/equilux-v$pkgver.zip")
sha256sums=('951f7f6a813dc1eae1bdf90dac8b7cf542a16a4c3e857c2778ba1508e65a3576')

package() {
	cd equilux-theme-equilux-v${pkgver}
	export destdir="$pkgdir/"
	mkdir -p "${pkgdir}/usr/share/themes"
	./install.sh -d "${pkgdir}/usr/share/themes"
}
