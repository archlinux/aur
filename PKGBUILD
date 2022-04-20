# Maintainer:  nissen22


pkgname=cudatext-gtk2-bin
pkgver=1.162.0.3
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
sha256sums=('ee8dcd8553eaee2f54eada53e2b244f0501f9d70be08bee8855a9f9d216d84e1')

package() {
    tar xvf "${srcdir}/data.tar.xz" -C "${pkgdir}/"
}
