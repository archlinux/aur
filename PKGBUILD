# Maintainer: Youknow-sys <samani0019 at gmail dot com>

pkgname=dorion-bin
pkgver=6.12.2
pkgrel=1
pkgdesc="Tiny alternative Discord client with a smaller footprint, snappier startup, themes, plugins and more!"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://spikehd.github.io/projects/dorion"
license=('GPL3')
depends=('libayatana-appindicator' 'webkit2gtk-4.1' 'gtk3' 'gst-plugins-good' 'gst-plugins-base')
provides=('dorion')
conflicts=('dorion')
source_x86_64=("https://github.com/SpikeHD/Dorion/releases/download/v${pkgver}/Dorion_${pkgver}_amd64.deb")
source_aarch64=("https://github.com/SpikeHD/Dorion/releases/download/v${pkgver}/Dorion_${pkgver}_arm64.deb")
source_armv7h=("https://github.com/SpikeHD/Dorion/releases/download/v${pkgver}/Dorion_${pkgver}_armhf.deb")
sha256sums_x86_64=('e12dc43691d1139746709d9806ce448cb3de5aeaff1a4962d7a7859866d09393')
sha256sums_aarch64=('a206a1bcf0e80b6b89ac19f3e4dcef3027125e8e42ec5ac35fff80aec066a8ec')
sha256sums_armv7h=('c5c62e7a4929f73858b2ca88ef05c1c58b84efd660b3c9743874da9fe8542913')

package() {
    bsdtar -xf "$srcdir/data.tar.gz" -C "$pkgdir"
}

