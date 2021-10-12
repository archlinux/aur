# Maintainer:  nissen22


pkgname=cudatext-gtk2-bin
pkgver=1.146.2.0
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
sha256sums=('3542a22d992bb52e4142f9b9f56df46c381b36f87aea28bef78a5b364a6330a0')

package() {
    tar xvf "${srcdir}/data.tar.xz" -C "${pkgdir}/"
}
