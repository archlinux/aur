# Maintainer:  eltonff


pkgname=cudatext-gtk3-bin
pkgver=1.240.0.6
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
sha256sums=('e72a5ac7ed9de92889e80ca548fe4d05a5f3e1093b38d1cf2a964d16c5d46501')

package() {
    tar xvf "${srcdir}/data.tar.zst" -C "${pkgdir}/"
}
