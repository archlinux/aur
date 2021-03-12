# Maintainer:  nissen22


pkgname=cudatext-gtk2-bin
pkgver=1.129.0.1
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
sha256sums=('a0d4004b5d317f864fc08d828ea25135b78249b1dbb835354884ca40d9923a9f')

package() {
    tar xvf "${srcdir}/data.tar.xz" -C "${pkgdir}/"
}
