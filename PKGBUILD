# Maintainer: kanak <mathias.bragagia@epitech.eu>

_pkgname=lightdm-webkit-theme-bevel
pkgname=$_pkgname-git
pkgver=0.1
pkgrel=1
pkgdesc="A fork of Blender3D's theme"
arch=('i686' 'x86_64')
url="https://github.com/jqln-0/Bevel"
license=()
depends=('lightdm-webkit-greeter')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git://github.com/jqln-0/Bevel.git")
md5sums=('SKIP')

package() {
	install -dm755 "$pkgdir/usr/share/lightdm-webkit/themes/"	
	cp -r "$srcdir/Bevel" "$pkgdir/usr/share/lightdm-webkit/themes/"
}
