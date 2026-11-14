# Maintainer:  eltonff


pkgname=cudatext-gtk2-bin
pkgver=1.239.1.0
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
sha256sums=('3a90c97f517b4c9f53211d57e1e696605d41af26c2230e77d673cff2718de1fe')

package() {
    tar xvf "${srcdir}/data.tar.zst" -C "${pkgdir}/"
}
