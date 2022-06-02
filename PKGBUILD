# Maintainer:  nissen22


pkgname=cudatext-gtk2-bin
pkgver=1.165.2.0
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
sha256sums=('8ecb0b8b788359886146c65994dd8970e6da16cddcffd8b868740f55d06829d4')

package() {
    tar xvf "${srcdir}/data.tar.xz" -C "${pkgdir}/"
}
