# Maintainer:  nissen22


pkgname=cudatext-gtk2-bin
pkgver=1.168.6.1
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
sha256sums=('abb2340fbfd888bc87f7c870656679fe82156109373c5c695eafa0569bac360a')

package() {
    tar xvf "${srcdir}/data.tar.xz" -C "${pkgdir}/"
}
