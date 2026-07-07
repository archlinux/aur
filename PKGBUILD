# Maintainer: simonlinuxcraft <simonlinuxcraft at users dot noreply dot github dot com>
# Contributor: Yilmaz4 <https://github.com/Yilmaz4>
pkgname=kyber-launcher-unofficial-appimage
pkgver=2.0.0_beta9_6.4.11
pkgrel=1
epoch=
pkgdesc="Native binary build of the Kyber V2 mod launcher for Star Wars Battlefront II (2017), by Yilmaz4. Renamed to kyber-launcher-bin at beta 10. Not endorsed by the Kyber team."
arch=('x86_64')
url="https://github.com/simonlinuxcraft/kyber-linuxport-unofficial"
license=('GPL-3.0-only')
groups=()
depends=('gtk3' 'mpv' 'ffmpeg' 'gstreamer' 'gst-plugins-base-libs' 'curl' 'zeromq' 'libsecret' 'libepoxy' 'librsvg' 'glib2' 'tinysparql' 'glycin')
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
source=("$pkgname-$pkgver.tar.xz::https://github.com/Yilmaz4/kyber-linuxport-unofficial/releases/download/$pkgver/$pkgver.tar.xz")
noextract=()
sha256sums=("34afd802010b29a25b6f46a9b71b17ca723d1fcf38226d49aa85448aed402669")
validpgpkeys=()

package() {
	cd "$srcdir/"
    cp -r usr opt "$pkgdir/"
    mkdir -p "$pkgdir/usr/bin"
    ln -sf '../../opt/kyber/kyber_launcher' "$pkgdir/usr/bin/kyber_launcher"
}
