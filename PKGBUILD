# Maintainer: simonlinuxcraft <simonlinuxcraft at users dot noreply dot github dot com>
# Contributor: Yilmaz4 <https://github.com/Yilmaz4>
pkgname=kyber-launcher-unofficial-appimage
pkgver=2.0.0_beta9_6.4.13
_appver=0.1.0-beta.6.4.13
pkgrel=1
epoch=
pkgdesc="Native binary build of the Kyber V2 mod launcher for Star Wars Battlefront II (2017). Renamed to kyber-launcher-bin at beta 10. Not endorsed by the Kyber team."
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
source=("$pkgname-$pkgver.tar.xz::$url/releases/download/v${_appver}/${pkgver}.tar.xz")
noextract=()
sha256sums=("a4bcd96138004e0b5eaa7beb94228d35e481e2124d5ffe1322b1516706e4cb4b")
validpgpkeys=()

package() {
	cd "$srcdir/"
    cp -r usr opt "$pkgdir/"
    mkdir -p "$pkgdir/usr/bin"
    ln -sf '../../opt/kyber/kyber_launcher' "$pkgdir/usr/bin/kyber_launcher"
}
