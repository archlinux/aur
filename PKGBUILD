# Maintainer:  eltonff


pkgname=cudatext-gtk3-bin
pkgver=1.237.0.2
pkgrel=1
pkgdesc="Cross-platform text editor, written in Lazarus"
arch=('x86_64')
url="https://cudatext.github.io"
license=('MPL2')
depends=('gtk3'
         'python')
provides=('cudatext')
conflicts=('cudatext')
options=('!strip')
source=("https://sourceforge.net/projects/cudatext/files/release/${pkgver}/cudatext_${pkgver}-${pkgrel}_gtk3_amd64.deb")
sha256sums=('df6145970e91754904a18bb4b4fa88203c98c91c9a5ff07ac74437bcb5545cb5')

package() {
    tar xvf "${srcdir}/data.tar.zst" -C "${pkgdir}/"
}
