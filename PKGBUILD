# Maintainer: Youknow-sys <samani0019 at gmail dot com>

pkgname=dorion-bin
pkgver=6.11.0
pkgrel=2
pkgdesc="Tiny alternative Discord client with a smaller footprint, snappier startup, themes, plugins and more!"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://spikehd.github.io/projects/dorion"
license=('GPL3')
depends=('libayatana-appindicator' 'webkit2gtk-4.1' 'gtk3' 'gst-plugins-good' 'gst-plugins-base' 'gst-plugins-bad')
provides=('dorion')
conflicts=('dorion')
source_x86_64=("https://github.com/SpikeHD/Dorion/releases/download/v${pkgver}/Dorion_${pkgver}_amd64.deb")
source_aarch64=("https://github.com/SpikeHD/Dorion/releases/download/v${pkgver}/Dorion_${pkgver}_arm64.deb")
source_armv7h=("https://github.com/SpikeHD/Dorion/releases/download/v${pkgver}/Dorion_${pkgver}_armhf.deb")
sha256sums_x86_64=('409c4ca8d18f3155dd88fda0ef7b5f93396aff5913ed9db93486a050cbb41a0a')
sha256sums_aarch64=('f48e3510dbf6a793fd3ffa69f17f31f8c8e63814a360d1698b0648e1d919a724')
sha256sums_armv7h=('3214eecff199c5936e9029d111f70ece72892e63472b69e7d9c51c0e6548b6d6')

package() {
    bsdtar -xf "$srcdir/data.tar.gz" -C "$pkgdir"
}
