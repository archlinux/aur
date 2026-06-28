
# Maintainer: Rafael Senties Martinelli <contact@rsm92.fr>

pkgname=phantom-player-git
pkgver=v2.1.0.r117.gef8c550
pkgrel=1
epoch=
pkgdesc="Smart video player and playlist manager"
arch=("any")
url="https://phantom-player.rsm92.fr"
license=('PFSSL-1.0')
groups=()
depends=(
	"gtk4"
	"gstreamer"
	"gst-plugins-base"
	"gst-plugins-base-libs"
	"gst-plugins-good"
	"gst-plugin-gtk4"
	"python"
	"python-gobject"
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
source=("https://codeberg.org/rsm92/phantom-player/archive/ef8c550878ed9641b53470e7bae56f5a49359808.zip")
noextract=()
sha256sums=('48f85b839089c64b42fd67c08055f7be5d371997f12a0293a60b57cdb1693212')
validpgpkeys=()

package() {
    cd phantom-player
    cp -a usr "$pkgdir/"
}
