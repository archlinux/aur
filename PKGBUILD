
# Maintainer: Rafael Senties Martinelli <contact@rsm92.fr>

pkgname=phantom-player-git
pkgver=v2.1.0.r111.ge41d132
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
source=("https://codeberg.org/rsm92/phantom-player/archive/e41d1329eff3e0a6d71f4ce5a813b1aa84693eab.zip")
noextract=()
sha256sums=('0bce815412ea37d57d360e3a2fb2a46d9da48a37936f814dbc7b1a5e61fa13bb')
validpgpkeys=()

package() {
    cd phantom-player
    cp -a usr "$pkgdir/"
}
