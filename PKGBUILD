# Maintainer:  eltonff


pkgname=cudatext-gtk2-bin
pkgver=1.231.2.0
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
sha256sums=('707e8d33a6bf38c11faa1d715f5834cc1d30c34dc7c1450cb8e9b14ec5eced9b')

package() {
    tar xvf "${srcdir}/data.tar.zst" -C "${pkgdir}/"
}
