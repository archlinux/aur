pkgname="equilux-theme"
pkgver=20180110
pkgrel=2
pkgdesc="A couple of full-dark, neutral-gray themes (for GTK2, GTK3, Shell, and GDM) using the Equilux palette."
arch=('any')
url="https://github.com/ddnexus/equilux-theme"
license=('GPL')
source=("https://github.com/ddnexus/equilux-theme/archive/equilux-v20180110.zip")
sha256sums=('f28ee8a97a4d08ad7939f3fdb8cf2012394bf48c04eeda3827a7a97afe0cc7d1')

package() {
	cd equilux-theme-equilux-v${pkgver}
	export destdir="$pkgdir/"
	./install.sh
}

