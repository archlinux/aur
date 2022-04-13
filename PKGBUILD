# Maintainer: Levinit <levinit at outlook>

pkgname=candy-gtk-theme
pkgver=0.3
pkgrel=2
pkgdesc="A flat style gtk&gnome-shell theme.Based on flat-plat and adapta"
arch=('any')
url="https://github.com/levinit/candy-gtk-theme"
license=('GPL3')

#makedepends=('')
source=("https://github.com/levinit/candy-gtk-theme/archive/refs/heads/master.zip")
sha512sums=('ab99f4a064c241c97ff97155c054de365931387987fbff0734247a0546bfe9bdfd8fc94b7a4123e798e75e0c4cab9624e27d011902a2dc2fa712b56d7ff7e014')

package() {
	install -dm 755 ${pkgdir}/usr/share/themes
	cp -r  ${srcdir}/${pkgname}-master/Candy  ${pkgdir}/usr/share/themes/
}

