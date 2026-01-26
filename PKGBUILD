
# Maintainer: Rafael Senties Martinelli <contact@rsm92.fr>

pkgname=phantom-player-git
pkgver=v2.0.1.r115.g25c8006
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
	"gst-plugins-bad"
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
	"gst-plugins-ugly"
)
provides=("phantom-player")
conflicts=("phantom-player")
replaces=()
backup=()
options=()
install=
changelog=
source=("https://codeberg.org/rsm92/phantom-player/archive/25c8006eb60e2e4880e2e098ca50e4798f944415.zip")
noextract=()
sha256sums=('70920f9bc7384e277e15b917bed7fa73f413d7715f1593f6d30851b032e54255')
validpgpkeys=()

package() {
	cd "phantom-player"
	ls -la
	cp -r ./usr "$pkgdir" 
}
