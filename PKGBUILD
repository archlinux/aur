pkgname="equilux-theme"
pkgver=20180513
pkgrel=1
pkgdesc="A couple of full-dark, neutral-gray themes (for GTK2, GTK3, Shell, and GDM) using the Equilux palette."
arch=('any')
url="https://github.com/ddnexus/equilux-theme"
license=('GPL')
source=("https://github.com/ddnexus/equilux-theme/archive/equilux-v$pkgver.zip")
sha256sums=('16998cce66add463ca719e943abf465526bd012df0b3c9d8d714c5e6f0851e7b')

package() {
	cd equilux-theme-equilux-v${pkgver}
	export destdir="$pkgdir/"
	mkdir -p "${pkgdir}/usr/share/themes"
	./install.sh -d "${pkgdir}/usr/share/themes"
}
