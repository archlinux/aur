# Maintainer: Levinit <levinit at outlook>

pkgname=gnome-osx-theme
pkgver=1.0
pkgrel=1
pkgdesc="a gnome-desktop-interpretation of Mac OSX"
arch=('any')
url="https://www.gnome-look.org/p/1171688/"
license=('GPL3')
optdepends=('gtk-engine-murrine: gtk2 bindings' 'gtk3: gtk3 bindings')
makedepends=('git')

source=("https://dl.opendesktop.org/api/files/download/id/1504612738/Gnome%20OSX-III-1.0.tar.gz")
sha512sums=('SKIP')

package() {
	install -dm 755 ${pkgdir}/usr/share/themes
	mv "${srcdir}/Gnome OSX-III-$pkgver" "${srcdir}/gnome-osx-theme"
	cp -r ${srcdir}/$pkgname  ${pkgdir}/usr/share/themes/
}
