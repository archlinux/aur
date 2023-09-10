# Maintainer: sataa <brodmoran[at]gmail[dot]com>

_theme="arch-circle"
_pkgname="plymouth-theme-$_theme"
pkgname="$_pkgname-git"
pkgbase="$_pkgname"
_gitname="$_pkgname"
_gitroot="git://github.com/FieryMewtwo/$_gitname.git"
pkgver=1
pkgrel=1
pkgdesc="A simple spinner theme for Plymouth based on plymouth-theme-sweet-arch"
arch=("any")
url="https://github.com/FieryMewtwo/$_gitname"
license=("GPL")
install="message.install"
depends=("plymouth")
makedepends=("git")
source=($_gitroot)
sha256sums=("SKIP")


package() {
	cd "$_gitname/$_theme"
	install -m755 -d "${pkgdir}/usr/share/plymouth/themes/$_theme"
	install -m644 -t "${pkgdir}/usr/share/plymouth/themes/$_theme" *
}
