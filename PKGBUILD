# Maintainer:  nissen22


pkgname=cudatext-gtk2-bin
pkgver=1.157.0.0
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
sha256sums=('2f4bcfd5a2493054726e46c54c958c4a8bae859cf606908a0eae70ea494abd81')

package() {
    tar xvf "${srcdir}/data.tar.xz" -C "${pkgdir}/"
}
