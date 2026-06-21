# Maintainer: simonlinuxcraft <simonlinuxcraft at users dot noreply dot github dot com>
# Contributor: Yilmaz4 <https://github.com/Yilmaz4>
pkgname=kyber-launcher-unofficial-appimage
pkgver=2.0.0_beta9_6.4.7
pkgrel=2
epoch=
pkgdesc="Native binary build of the Kyber V2 mod launcher for Star Wars Battlefront II (2017), by Yilmaz4. Renamed to kyber-launcher-bin at beta 10. Not endorsed by the Kyber team."
arch=('x86_64')
url="https://github.com/simonlinuxcraft/kyber-linuxport-unofficial"
license=('GPL-3.0-only')
groups=()
depends=('gtk3' 'mpv' 'ffmpeg' 'gstreamer' 'gst-plugins-base-libs' 'curl'
         'zeromq' 'libsecret' 'libepoxy' 'librsvg' 'glib2' 'tinysparql' 'glycin')
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
source=("$pkgname-$pkgver.tar.gz::https://github.com/Yilmaz4/kyber-linuxport-unofficial/releases/download/$pkgver/$pkgver.tar.gz")
noextract=()
sha256sums=("ea9ae8019a836c85531f9c2ecc876d63951e92e3fd27bc5ca7769e6a32c543ed")
validpgpkeys=()

package() {
	cd "$srcdir/"
    cp -r usr opt "$pkgdir/"
    mkdir -p "$pkgdir/usr/bin"
    ln -sf '../../opt/kyber/kyber_launcher' "$pkgdir/usr/bin/kyber_launcher"
}
