# Maintainer: dag.robole at gmail dot com
# Contributor: defendor at riseup dot net

pkgname=gtk-theme-numix-solarized
pkgver=2015.08.12
pkgrel=5
pkgdesc="Solarized versions of Numix GTK2 and GTK3 theme"
arch=('any')
url="http://bitterologist.deviantart.com/art/Numix-Solarized-417575928"
license=('GPL3')
depends=('gtk-engine-murrine')
source=('http://fc01.deviantart.net/fs71/f/2014/183/b/f/numix_solarized_by_bitterologist-d6wm3nc.zip')
md5sums=('025c22eed1af7e245ad21936059a2d1f')

package() {
	mkdir -p ${pkgdir}/usr/share/themes/
	cp -rv ${srcdir}/Solarized\ theme/Numix\ Solarized ${pkgdir}/usr/share/themes/
	cp -rv ${srcdir}/Solarized\ theme/Numix\ Solarized\ Light ${pkgdir}/usr/share/themes/
}
