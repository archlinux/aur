# Maintainer:  eltonff


pkgname=cudatext-gtk2-bin
pkgver=1.228.0.0
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
sha256sums=('0223390ead8800195ab11120752ae96faa03b1c15c1215ab091ac034aba23e20')

package() {
    tar xvf "${srcdir}/data.tar.zst" -C "${pkgdir}/"
}
