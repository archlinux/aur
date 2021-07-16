# Maintainer:  nissen22


pkgname=cudatext-gtk2-bin
pkgver=1.137.2.1
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
sha256sums=('cb15610c04c96725050b6907bd37254ac5785c329f9c857c7593b4d7c96c1e86')

package() {
    tar xvf "${srcdir}/data.tar.xz" -C "${pkgdir}/"
}
