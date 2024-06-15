# Maintainer: thorou <thorou@chirality.de>

_pkgname=gravel
pkgname=$_pkgname-bin
pkgver=0.6.0
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
sha256sums=("cc7cd08b1482464949fc6ed8a33b6cbda4ce3ad5e4340987dbf01621b3c1e916")

package() {
	cp -ar usr $pkgdir/usr
}
