# Maintainer: Abraham Murciano <abrahammurciano[at]gmail[dot]com>

_theme="sweet-arch"
_pkgname="plymouth-theme-$_theme"
pkgname="$_pkgname-git"
_gitname=$_pkgname
pkgver=3
pkgrel=1
pkgdesc="Make your Arch Linux splash screen look wonderful with this theme inspired by Sweet by EliverLara."
arch=("any")
url="https://github.com/abrahammurciano/$_gitname"
license=("GPL")
install="message.install"
depends=("plymouth")
makedepends=("git")
source=("git+$url.git")
sha256sums=("SKIP")


package() {
	cd "$_gitname/$_theme"
	install -m755 -d "${pkgdir}/usr/share/plymouth/themes/$_theme"
	install -m644 -t "${pkgdir}/usr/share/plymouth/themes/$_theme" *
}
