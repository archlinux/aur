
# Maintainer: Rafael Senties Martinelli <contact@rsm92.fr>

pkgname=phantom-player-git
pkgver=v2.0.1.r109.g302f65a
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
source=("https://codeberg.org/rsm92/phantom-player/archive/302f65a306f1121b0e07bb21bd0d546a78a19842.zip")
noextract=()
sha256sums=('85baa79594bcc3ee61b1d41b25d3db72740e1b17dc83cd1f50250fc7147c432f')
validpgpkeys=()

package() {
	cd "phantom-player"
	ls -la
	cp -r ./usr "$pkgdir" 
}
