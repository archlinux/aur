# Maintainer: Refined7075 <yxgw5rdy2@mozmail.com>
pkgname=dorion-bin
pkgver=1.0.1
pkgrel=1
pkgdesc="An alternative Discord client aimed and lower-spec or storage-sensitive PCs that supports themes, plugins, and more!"
arch=('x86_64')
url="https://spikehd.github.io/projects/dorion/"
license=('GPL3')
depends=('libayatana-appindicator' 'webkit2gtk' 'gtk3')
provides=('dorion')
conflicts=('dorion')
source=("https://github.com/SpikeHD/Dorion/releases/download/v${pkgver}/dorion_${pkgver}_amd64.deb")
sha256sums=('44aaaef9a34b09b8c7fbcd363c26e889ac98a869534ce2438f31da00cc886e3f')

package() {
    bsdtar -xf "$srcdir/data.tar.gz" -C "$pkgdir"
}
