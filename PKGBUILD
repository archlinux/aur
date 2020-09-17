# Maintainer:  nissen22


pkgname=cudatext-gtk2-bin
pkgver=1.112.1.0
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
sha256sums=('188c8cecded97a9e8cc423da15f247b1d839002c00227fb210511b4dd1e49338')

package() {
    tar xvf "${srcdir}/data.tar.xz" -C "${pkgdir}/"
}
