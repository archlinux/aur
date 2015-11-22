# Maintainer: dag.robole at gmail dot com
# Contributor: defendor at riseup dot net

pkgname=gtk-theme-numix-solarized
pkgver=20151122
pkgrel=2
pkgdesc="Solarized versions of Numix GTK2 and GTK3 theme"
arch=('any')
url="http://bitterologist.deviantart.com/art/Numix-Solarized-417575928"
license=('GPL3')
depends=('gtk-engine-murrine')
source=('https://github.com/corebob/numix-solarized/archive/v0.2.zip')
md5sums=('920102c90ae0bb59a0b6799010d5934f')

package() {
	mkdir -p ${pkgdir}/usr/share/themes/
	cp -r ${srcdir}/numix-solarized-0.2/Numix\ Solarized ${pkgdir}/usr/share/themes/
	cp -r ${srcdir}/numix-solarized-0.2/Numix\ Solarized\ Light ${pkgdir}/usr/share/themes/
}
