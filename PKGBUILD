# Maintainer:  nissen22


pkgname=cudatext-gtk2-bin
pkgver=1.166.3.0
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
sha256sums=('abde8d5c61b1f4397bc68c2c0ea0157654de086a6f6f369a029ef83b2468aadc')

package() {
    tar xvf "${srcdir}/data.tar.xz" -C "${pkgdir}/"
}
