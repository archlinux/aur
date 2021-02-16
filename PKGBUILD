# Maintainer:  nissen22


pkgname=cudatext-gtk2-bin
pkgver=1.125.0.1
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
sha256sums=('f3d132a7789152d686f91f99ca434fad1ab37f999047e1474053f4346e506057')

package() {
    tar xvf "${srcdir}/data.tar.xz" -C "${pkgdir}/"
}
