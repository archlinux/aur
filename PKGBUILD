# Maintainer:  eltonff


pkgname=cudatext-gtk3-bin
pkgver=1.235.1.0
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
sha256sums=('1a17dda3f858c099a0b3bc768ef521b97f9eb97c236d27b759e7c87b63a61844')

package() {
    tar xvf "${srcdir}/data.tar.zst" -C "${pkgdir}/"
}
