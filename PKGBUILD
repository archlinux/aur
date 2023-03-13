# Maintainer:  nissen22


pkgname=cudatext-gtk2-bin
pkgver=1.187.0.0
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
sha256sums=('950037491ebf0fcfe8d0c8aed67fd7671936b273370d37e41e13416ea1981159')

package() {
    tar xvf "${srcdir}/data.tar.xz" -C "${pkgdir}/"
}
