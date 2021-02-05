# Maintainer:  nissen22


pkgname=cudatext-gtk2-bin
pkgver=1.123.3.2
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
sha256sums=('7770d3360f81386cc3eae6ef9128fb7feb8cbcaf0d2b984c30b9f1be83391b5f')

package() {
    tar xvf "${srcdir}/data.tar.xz" -C "${pkgdir}/"
}
