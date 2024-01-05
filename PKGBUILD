# Maintainer: Refined7075 <yxgw5rdy2@mozmail.com>
pkgname=dorion-bin
pkgver=3.1.1
pkgrel=2
pkgdesc="An alternative Discord client aimed and lower-spec or storage-sensitive PCs that supports themes, plugins, and more!"
arch=('x86_64')
url="https://spikehd.github.io/projects/dorion/"
license=('GPL3')
depends=('libayatana-appindicator' 'webkit2gtk' 'gtk3')
provides=('dorion')
conflicts=('dorion')
source=("https://github.com/SpikeHD/Dorion/releases/download/v${pkgver}/Dorion_${pkgver}_amd64.deb")
sha256sums=('c2f96647822558e285f93e94b9ce8c6a29d6b3e72a78930ef44e92b9cff840c5')

package() {
    bsdtar -xf "$srcdir/data.tar.gz" -C "$pkgdir"
}
