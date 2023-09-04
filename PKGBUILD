# Maintainer: Refined7075 <yxgw5rdy2@mozmail.com>
pkgname=dorion-bin
pkgver=1.1.0
pkgrel=2
pkgdesc="An alternative Discord client aimed and lower-spec or storage-sensitive PCs that supports themes, plugins, and more!"
arch=('x86_64')
url="https://spikehd.github.io/projects/dorion/"
license=('GPL3')
depends=('libayatana-appindicator' 'webkit2gtk' 'gtk3')
provides=('dorion')
conflicts=('dorion')
source=("https://github.com/SpikeHD/Dorion/releases/download/v${pkgver}/dorion_${pkgver}_amd64.deb")
sha256sums=('e8f287f4e09f42b3dce360930e7c22077b6077a2aa7c7fd78e29eb99f51aa810')

package() {
    bsdtar -xf "$srcdir/data.tar.gz" -C "$pkgdir"
}
