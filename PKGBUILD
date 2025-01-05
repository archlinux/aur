# Maintainer: thorou <thorou@chirality.de>

_pkgname=gravel
pkgname=$_pkgname-bin
pkgver=0.8.2
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
sha256sums=("1abe77fc9ac63e03308b020a2fc9ca9bc4778eaf05e8a4de92eeea89e358c169")

package() {
	cp -ar usr $pkgdir/usr
}
