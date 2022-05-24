# Maintainer:  nissen22


pkgname=cudatext-gtk2-bin
pkgver=1.165.0.3
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
sha256sums=('6d2fb61d12b2c5930b6d6002614ead8cb0c3bd2796f0226dbe2dfc3f74a4f3a8')

package() {
    tar xvf "${srcdir}/data.tar.xz" -C "${pkgdir}/"
}
