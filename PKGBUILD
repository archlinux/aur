# Maintainer:  eltonff


pkgname=cudatext-gtk2-bin
pkgver=1.228.3.0
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
sha256sums=('46794d8a023a4ef191bf76d02106b19897821d1427f6210d8005b1650fa60071')

package() {
    tar xvf "${srcdir}/data.tar.zst" -C "${pkgdir}/"
}
