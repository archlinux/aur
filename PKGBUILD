# Maintainer: kanak <mathias.bragagia@epitech.eu>

pkgname=lightdm-webkit2-theme-bevel-git
pkgver=0.3
pkgrel=1
pkgdesc="A fork of Blender3D's theme"
arch=('i686' 'x86_64')
url="https://github.com/bragagia/Bevel"
license=()
depends=('lightdm-webkit-greeter')
makedepends=('git')
provides=("lightdm-webkit-theme-bevel" "lightdm-webkit-theme-bevel-git")
conflicts=("lightdm-webkit-theme-bevel" "lightdm-webkit-theme-bevel-git")
source=("git://github.com/bragagia/Bevel.git")
md5sums=('SKIP')

package() {
	install -dm755 "$pkgdir/usr/share/lightdm-webkit/themes/"
	rm -rf "$srcdir"/Bevel/.git
	cp -r "$srcdir/Bevel" "$pkgdir/usr/share/lightdm-webkit/themes/"
}
