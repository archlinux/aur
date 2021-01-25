# Maintainer:  nissen22


pkgname=cudatext-gtk2-bin
pkgver=1.122.3.0
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
sha256sums=('526867a045f8e81d2bec4debe337fc80bd5f41b6c5f0ef5f537f6bece7090d38')

package() {
    tar xvf "${srcdir}/data.tar.xz" -C "${pkgdir}/"
}
