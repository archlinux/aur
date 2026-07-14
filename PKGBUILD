# Maintainer:  eltonff


pkgname=cudatext-gtk2-bin
pkgver=1.235.0.0
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
sha256sums=('11943d9bcf785ce06c3d05ae79c187effcd369e95e66646f9a9cd0664c1bf80c')

package() {
    tar xvf "${srcdir}/data.tar.zst" -C "${pkgdir}/"
}
