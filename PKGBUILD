# Maintainer: Tivoli Cloud VR <maki@tivolicloud.com>
# Maintainer: Maki <mxmcube@gmail.com>
pkgname="tivoli-cloud-vr-bin"
pkgver=0.16.2
pkgrel=1
pkgdesc="Free and open-source metaverse to create positive social impact."
arch=("x86_64")
url="https://tivolicloud.com"
license=("AGPL3")
depends=(
	"c-ares"
	"ffmpeg"
	"gtk3"
	"http-parser"
	"libevent"
	"libvpx"
	"libxslt"
	"libxss"
	"minizip"
	"nss"
	"re2"
	"snappy"
	"libnotify"
	"libappindicator-gtk3"
)
provides=("tivoli-cloud-vr")
conflicts=("tivoli-cloud-vr")
options=("!strip")
install="tivoli-cloud-vr.install"
source=("tivoli-cloud-vr-$pkgver.tar.xz::https://cdn.tivolicloud.com/releases/Tivoli%20Cloud%20VR%20$pkgver.pacman")
sha256sums=("SKIP")

package() {
	cd "${_pkgname}"
	rm -f .INSTALL .MTREE .PKGINFO
	mv * "${pkgdir}"
	chmod 755 "${pkgdir}/opt/Tivoli Cloud VR/tivoli-cloud-vr"
}
