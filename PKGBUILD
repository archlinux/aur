# Maintainer:  eltonff


pkgname=cudatext-gtk2-bin
pkgver=1.219.0.2
pkgrel=1
pkgdesc="Cross-platform text editor, written in Lazarus"
arch=('x86_64')
url="http://uvviewsoft.com/cudatext"
license=('MPL2')
depends=('gtk2'
         'python')
provides=('cudatext')
conflicts=('cudatext')
options=('!strip')
source=("http://www.uvviewsoft.com/cudatext/files_linux/cudatext_${pkgver}-${pkgrel}_gtk2_amd64.deb")
sha256sums=('45bf678747c6ca23e069599da3d6e97815d897704dcdaf46593464c4ccc9f024')

package() {
    tar xvf "${srcdir}/data.tar.zst" -C "${pkgdir}/"
}
