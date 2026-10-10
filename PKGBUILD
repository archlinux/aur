# Maintainer: simonlinuxcraft <simonlinuxcraft at users dot noreply dot github dot com>
# Contributor: Yilmaz4 <https://github.com/Yilmaz4>
pkgname=kyber-launcher-unofficial-appimage
pkgver=7.0.0_beta10
_appver=7.0.0-beta10
pkgrel=1
epoch=
pkgdesc="Native binary build of the Kyber V2 mod launcher for Star Wars Battlefront II (2017). Not endorsed by the Kyber team."
arch=('x86_64')
url="https://github.com/simonlinuxcraft/kyber-linuxport-unofficial"
license=('GPL-3.0-only')
groups=()
depends=('gtk3' 'mpv' 'ffmpeg' 'gstreamer' 'gst-plugins-base' 'gst-plugins-base-libs' 'libarchive' 'curl' 'zeromq' 'libsecret' 'libepoxy' 'librsvg' 'glib2' 'tinysparql' 'glycin')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=(kyber-launcher-inofficial-appimage)
replaces=(kyber-launcher-inofficial-appimage)
backup=()
options=(!debug)
install="${pkgname}.install"
changelog=
source=("$pkgname-$pkgver.tar.xz::$url/releases/download/v${_appver}/${pkgver}.tar.xz")
noextract=()
sha256sums=("e53703475eca88c98400d080da3c400c1b2873932deb4d362012c64131e82c27")
validpgpkeys=()

package() {
	cd "$srcdir/"
    cp -r usr opt "$pkgdir/"
    mkdir -p "$pkgdir/usr/bin"
    ln -sf '../../opt/kyber/kyber_launcher' "$pkgdir/usr/bin/kyber_launcher"
}
