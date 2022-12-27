# Maintainer:  nissen22


pkgname=cudatext-gtk2-bin
pkgver=1.180.0.0
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
sha256sums=('609c234347210fb95dbe6c2d577d7523697683f66d3736388ecf7e00218daa92')

package() {
    tar xvf "${srcdir}/data.tar.xz" -C "${pkgdir}/"
}
