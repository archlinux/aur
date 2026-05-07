
# Maintainer: Rafael Senties Martinelli <contact@rsm92.fr>

pkgname=phantom-player
pkgver=2.1.0
pkgrel=1
epoch=
pkgdesc="Smart video player and playlist manager"
arch=("any")
url="https://phantom-player.rsm92.fr"
license=('PFSSL-1.0')
groups=()
depends=(
	"gtk3" 
	"gstreamer"
	"gst-plugins-base"
	"gst-plugins-base-libs"
	"gst-plugins-good"
	"gst-plugin-gtk"
	"python"
	"python-cairo"
	"python-pillow"
	"python-magic"
	"python-send2trash"
)
makedepends=("git")
checkdepends=()
optdepends=(
	"gst-libav"
	"gst-plugins-bad"
	"gst-plugins-ugly"
)
provides=("phantom-player")
conflicts=("phantom-player")
replaces=()
backup=()
options=()
install=
changelog=
source=("https://codeberg.org/rsm92/phantom-player/archive/v2.1.0.zip")
noextract=()
sha256sums=('6a27a9f55591564366a43741c18a532511b6dd9eb1e7530b14facf073caca7a3')
validpgpkeys=()

package() {
    cd phantom-player
    cp -a usr "$pkgdir/"
}
