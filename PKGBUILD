# Maintainer: Levinit <levinit at outlook>

pkgname=candy-gtk-theme
pkgver=0.3
pkgrel=1
pkgdesc="A flat style gtk&gnome-shell theme.Based on flat-plat and adapta"
arch=('any')
url="https://github.com/levinit/candy-gtk-theme"
license=('GPL3')

makedepends=('git')
source=("git://github.com/levinit/candy-gtk-theme")
sha512sums=('SKIP')

package() {
	install -dm 755 ${pkgdir}/usr/share/themes
	cp -r  ${srcdir}/${pkgname}/Candy  ${pkgdir}/usr/share/themes/
}

