# Maintainer: Refined7075 <yxgw5rdy2@mozmail.com>
pkgname=dorion-bin
pkgver=4.1.2
pkgrel=2
pkgdesc="An alternative Discord client aimed and lower-spec or storage-sensitive PCs that supports themes, plugins, and more!"
arch=('x86_64')
url="https://spikehd.github.io/projects/dorion/"
license=('GPL3')
depends=('libayatana-appindicator' 'webkit2gtk' 'gtk3')
provides=('dorion')
conflicts=('dorion')
source=("https://github.com/SpikeHD/Dorion/releases/download/v${pkgver}/Dorion_${pkgver}_amd64.deb")
sha256sums=('869645f3740f45c46a234c029c8bba0ac3417bc6fd1f42ab0f2a7a08362439f4')

package() {
    bsdtar -xf "$srcdir/data.tar.gz" -C "$pkgdir"
}
