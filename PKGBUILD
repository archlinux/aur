# Maintainer:  nissen22


pkgname=cudatext-gtk2-bin
pkgver=1.118.2.0
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
sha256sums=('8fee70892cb8b925113391465274925b0ce97eb0d6393dbb96cc243ff5521f30')

package() {
    tar xvf "${srcdir}/data.tar.xz" -C "${pkgdir}/"
}
