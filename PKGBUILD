# Maintainer: Refined7075 <yxgw5rdy2@mozmail.com>
pkgname=dorion-bin
pkgver=0.9.0
pkgrel=1
pkgdesc="An alternative Discord client aimed and lower-spec or storage-sensitive PCs that supports themes, plugins, and more!"
arch=('x86_64')
url="https://spikehd.github.io/projects/dorion/"
license=('GPL3')
depends=('libayatana-appindicator' 'webkit2gtk' 'gtk3')
provides=('dorion')
conflicts=('dorion')
source=("https://github.com/SpikeHD/Dorion/releases/download/v${pkgver}/dorion_${pkgver}_amd64.deb")
sha256sums=('bb06e8a86408a8e8bf700c6ab8fde63328661997e437f0b3753450b22b5b2e18')

package() {
    bsdtar -xf "$srcdir/data.tar.gz" -C "$pkgdir"
}
