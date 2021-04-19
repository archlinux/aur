# Maintainer:  nissen22


pkgname=cudatext-gtk2-bin
pkgver=1.132.0.6
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
sha256sums=('dc0c9655d4343a6271203c95dd4e905fa97f86ad97f4ac3f320138934ab38bcf')

package() {
    tar xvf "${srcdir}/data.tar.xz" -C "${pkgdir}/"
}
