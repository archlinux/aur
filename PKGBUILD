# Maintainer:  nissen22


pkgname=cudatext-gtk2-bin
pkgver=1.205.0.0
pkgrel=1
pkgdesc="Cross-platform text editor, written in Lazarus"
arch=('x86_64')
url="http://uvviewsoft.com/cudatext"
license=('MPL2')
depends=('gtk2'
         'python')
provides=('cudatext')
conflicts=('cudatext')
options=('!strip')
source=("http://www.uvviewsoft.com/cudatext/files_linux/cudatext_${pkgver}-${pkgrel}_gtk2_amd64.deb")
sha256sums=('bffd674adfe64b8721104eaa3956e96ed00419b709514d8be539163d1beb71a0')

package() {
    tar xvf "${srcdir}/data.tar.xz" -C "${pkgdir}/"
}
