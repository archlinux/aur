
# Maintainer: Rafael Senties Martinelli <contact@rsm92.fr>

pkgname=phantom-player-git
pkgver=v2.0.1.r48.g00054f5
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
source=("https://codeberg.org/rsm92/phantom-player/archive/00054f50522b1478c4e601dafb1191ee2840ddd5.zip")
noextract=()
sha256sums=('05263358ef043bfc91693a6a6c08862cce08e82a83d437837e9fd4f452c8599d')
validpgpkeys=()

package() {
	cd "phantom-player"
	ls -la
	cp -r ./usr "$pkgdir" 
}
