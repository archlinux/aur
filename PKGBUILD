# Maintainer:  nissen22


pkgname=cudatext-gtk2-bin
pkgver=1.182.2.0
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
sha256sums=('c0191359c6d42683bb94222cc64b8d5b1b187e9c39df6af427c9f2f7b7ca2561')

package() {
    tar xvf "${srcdir}/data.tar.xz" -C "${pkgdir}/"
}
