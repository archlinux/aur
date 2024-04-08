# Maintainer: Refined7075 <yxgw5rdy2@mozmail.com>
pkgname=dorion-bin
pkgver=4.1.3
pkgrel=2
pkgdesc="An alternative Discord client aimed and lower-spec or storage-sensitive PCs that supports themes, plugins, and more!"
arch=('x86_64')
url="https://spikehd.github.io/projects/dorion/"
license=('GPL3')
depends=('libayatana-appindicator' 'webkit2gtk' 'gtk3')
provides=('dorion')
conflicts=('dorion')
source=("https://github.com/SpikeHD/Dorion/releases/download/v${pkgver}/Dorion_${pkgver}_amd64.deb")
sha256sums=('3ba2973a8baeb6b3656b97641d141e4f4929f0340ef4c2e826b20cbaa6a6ffad')

package() {
    bsdtar -xf "$srcdir/data.tar.gz" -C "$pkgdir"
}
