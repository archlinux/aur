# Maintainer:  nissen22


pkgname=cudatext-gtk2-bin
pkgver=1.166.0.0
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
sha256sums=('5277e826a3ae9b1e4d177a5e80f501c7bae6c149a42045e1aa57cb2ad3139eb5')

package() {
    tar xvf "${srcdir}/data.tar.xz" -C "${pkgdir}/"
}
