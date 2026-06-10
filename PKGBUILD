# Maintainer:  eltonff


pkgname=cudatext-gtk2-bin
pkgver=1.234.4.0
pkgrel=1
pkgdesc="Cross-platform text editor, written in Lazarus"
arch=('x86_64')
url="https://cudatext.github.io"
license=('MPL2')
depends=('gtk2'
         'python')
provides=('cudatext')
conflicts=('cudatext')
options=('!strip')
source=("https://sourceforge.net/projects/cudatext/files/release/${pkgver}/cudatext_${pkgver}-${pkgrel}_gtk2_amd64.deb")
sha256sums=('4868450b44e3e88624945b7a65acacf61402d8b2e49860d5683ce7b0e7197c0c')

package() {
    tar xvf "${srcdir}/data.tar.zst" -C "${pkgdir}/"
}
