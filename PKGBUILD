# Maintainer:  nissen22


pkgname=cudatext-gtk2-bin
pkgver=1.107.1.0
pkgrel=1
pkgdesc="Cross-platform text editor, written in Lazarus"
arch=('x86_64')
url="http://uvviewsoft.com/cudatext"
license=('MPL2')
depends=('gtk2'
         'python')
provides=('cudatext')
options=('!strip')
source=("http://www.uvviewsoft.com/cudatext/files_linux/cudatext_${pkgver}-${pkgrel}_gtk2_amd64.deb")
sha256sums=('b3c36ada201338388648c16c3d5b9ea9024e2c9e3211eaeadc4ac77dd5edadf5')

package() {
    tar xvf "${srcdir}/data.tar.xz" -C "${pkgdir}/"
}
