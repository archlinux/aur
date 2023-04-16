# Maintainer:  nissen22


pkgname=cudatext-gtk2-bin
pkgver=1.191.0.1
pkgrel=1
pkgdesc="Cross-platform text editor, written in Lazarus"
arch=('x86_64')
url="http://uvviewsoft.com/cudatext"
license=('MPL2')
depends=('gtk2'
         'python')
provides=('cudatext')
conflicts=('cudatext-qt5-bin')
options=('!strip')
source=("http://www.uvviewsoft.com/cudatext/files_linux/cudatext_${pkgver}-${pkgrel}_gtk2_amd64.deb")
sha256sums=('6d4cf7a4dc11b0338fcc546c71334e4e4f815e4408edd2a989af76cddbdf1685')

package() {
    tar xvf "${srcdir}/data.tar.xz" -C "${pkgdir}/"
}
