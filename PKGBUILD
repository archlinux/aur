# Maintainer: Refined7075 <yxgw5rdy2@mozmail.com>
pkgname=dorion-bin
pkgver=1.2.0
pkgrel=2
pkgdesc="An alternative Discord client aimed and lower-spec or storage-sensitive PCs that supports themes, plugins, and more!"
arch=('x86_64')
url="https://spikehd.github.io/projects/dorion/"
license=('GPL3')
depends=('libayatana-appindicator' 'webkit2gtk' 'gtk3')
provides=('dorion')
conflicts=('dorion')
source=("https://github.com/SpikeHD/Dorion/releases/download/v${pkgver}/dorion_${pkgver}_amd64.deb")
sha256sums=('92957f2142331e0658b8596cf938559e7fe319f648c2208f26d07798f1eb7ff5')

package() {
    bsdtar -xf "$srcdir/data.tar.gz" -C "$pkgdir"
}
