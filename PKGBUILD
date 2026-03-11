# Maintainer:  eltonff


pkgname=cudatext-gtk2-bin
pkgver=1.233.1.0
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
sha256sums=('295105530d64c951e32a87d932cda697a433a095cb7cc540f4318ec7b15d019b')

package() {
    tar xvf "${srcdir}/data.tar.zst" -C "${pkgdir}/"
}
