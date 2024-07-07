# Maintainer: thorou <thorou@chirality.de>

_pkgname=gravel
pkgname=$_pkgname-bin
pkgver=0.7.0
pkgrel=1
pkgdesc="Cross-platform application launcher for Linux and Windows"
arch=("x86_64")
url="https://github.com/thorio/gravel"
license=("GPL3")
depends=("libx11" "libxext" "libxft" "libxinerama" "libxcursor" "libxrender" "libxfixes" "pango" "cairo" "libgl" "mesa" "coreutils" "gtk3" "xdg-utils")
provides=("$_pkgname")
conflicts=("$_pkgname")
options=('!strip')
source=("$url/releases/download/v$pkgver/gravel-arch-x86_64.pkg.tar.zst")
sha256sums=("dbbc355633766f78a6c43138f5e35c1f12c0a9fa8f5066f7f234220573fc194b")

package() {
	cp -ar usr $pkgdir/usr
}
