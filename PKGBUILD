# Maintainer:  eltonff


pkgname=cudatext-gtk3-bin
pkgver=1.238.0.0
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
sha256sums=('a1187262252e400c5940f836a891b31d86e884627134786274342db820e42f1b')

package() {
    tar xvf "${srcdir}/data.tar.zst" -C "${pkgdir}/"
}
