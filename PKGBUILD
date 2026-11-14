# Maintainer:  eltonff


pkgname=cudatext-gtk3-bin
pkgver=1.239.1.0
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
sha256sums=('6de8a3f75a0b75617c8920f020af2d8168782ebbeb4661198b2d44e512463832')

package() {
    tar xvf "${srcdir}/data.tar.zst" -C "${pkgdir}/"
}
