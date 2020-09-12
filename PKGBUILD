# Maintainer:  nissen22


pkgname=cudatext-gtk2-bin
pkgver=1.111.6.0
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
sha256sums=('c82e0a51d8ba66a0f5f2fae1db05b603bc155a870dbdfcae13057f7297598f0a')

package() {
    tar xvf "${srcdir}/data.tar.xz" -C "${pkgdir}/"
}
