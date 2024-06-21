# Maintainer: thorou <thorou@chirality.de>

_pkgname=gravel
pkgname=$_pkgname-bin
pkgver=0.6.1
pkgrel=1
pkgdesc="Cross-platform application launcher for Linux and Windows"
arch=("x86_64")
url="https://github.com/thorio/gravel"
license=("GPL3")
depends=("libx11" "libxext" "libxft" "libxinerama" "libxcursor" "libxrender" "libxfixes" "pango" "cairo" "libgl" "mesa" "coreutils" "gtk3" "xdg-utils")
provides=("$_pkgname")
conflicts=("$_pkgname")
options=('!strip')
source=("$url/releases/download/v$pkgver/gravel-x86_64.pkg.tar.zst")
sha256sums=("014d3d0856fd8900ec9f4df0ce6bfab4597a3e86abeac45e7b1747808de97c35")

package() {
	cp -ar usr $pkgdir/usr
}
