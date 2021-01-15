# Maintainer:  nissen22


pkgname=cudatext-gtk2-bin
pkgver=1.122.0.2
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
sha256sums=('1504871dee7986e33f4ddc38416a2ad7dd1611f1fb01532bd42c3df5f382b1e9')

package() {
    tar xvf "${srcdir}/data.tar.xz" -C "${pkgdir}/"
}
