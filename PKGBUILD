# Maintainer:  nissen22


pkgname=cudatext-gtk2-bin
pkgver=1.171.0.0
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
sha256sums=('f2b85895ed45cd6e38c7f5f77bd87e778a7cecfb8f8b8a8c881d738f769845a6')

package() {
    tar xvf "${srcdir}/data.tar.xz" -C "${pkgdir}/"
}
