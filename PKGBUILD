# Maintainer:  nissen22


pkgname=cudatext-gtk2-bin
pkgver=1.155.3.1
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
sha256sums=('50950f40e757a93f670e87260a88096b05076a8d498e7e6c3ef17646c95ca609')

package() {
    tar xvf "${srcdir}/data.tar.xz" -C "${pkgdir}/"
}
