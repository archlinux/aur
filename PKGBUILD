# Maintainer: dag.robole at gmail dot com
# Contributor: defendor at riseup dot net

pkgname=gtk-theme-numix-solarized
pkgver=20151122
pkgrel=1
pkgdesc="Solarized versions of Numix GTK2 and GTK3 theme"
arch=('any')
url="http://bitterologist.deviantart.com/art/Numix-Solarized-417575928"
license=('GPL3')
depends=('gtk-engine-murrine')
source=('https://github.com/corebob/numix-solarized/archive/v0.1.zip')
md5sums=('03aa40b5bd0464afde59ccc011e82af0')

package() {
	mkdir -p ${pkgdir}/usr/share/themes/
	cp -r ${srcdir}/numix-solarized-0.1/Numix\ Solarized ${pkgdir}/usr/share/themes/
	cp -r ${srcdir}/numix-solarized-0.1/Numix\ Solarized\ Light ${pkgdir}/usr/share/themes/
}
