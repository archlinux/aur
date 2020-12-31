# Maintainer:  nissen22


pkgname=cudatext-gtk2-bin
pkgver=1.119.0.0
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
sha256sums=('40d64cc04448871359e1a556cb2d98db0f17e6c5f37400d1ede89b574ed90e9c')

package() {
    tar xvf "${srcdir}/data.tar.xz" -C "${pkgdir}/"
}
