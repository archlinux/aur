
# Maintainer: Rafael Senties Martinelli <contact@rsm92.fr>

pkgname=phantom-player-git
pkgver=v2.0.1.r54.ge2e5051
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
source=("https://codeberg.org/rsm92/phantom-player/archive/e2e5051c65bb5ba743169a76fe9ec56845700b36.zip")
noextract=()
sha256sums=('56ef0c7aae38ea870be9ea8517fb00ad76f9a5ba6c9543a9c8f2b31cd69cac13')
validpgpkeys=()

package() {
	cd "phantom-player"
	ls -la
	cp -r ./usr "$pkgdir" 
}
