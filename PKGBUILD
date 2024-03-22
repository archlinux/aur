# Maintainer: thorou <thorou@chirality.de>

_pkgname=gravel
pkgname=$_pkgname-bin
pkgver=0.5.1
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
sha256sums=("d59ae150b577d682d1ba1d79907b4442dc615e050b2f4a07412190f65759d596")

package() {
	cp -ar usr $pkgdir/usr
}
