# Maintainer:  nissen22


pkgname=cudatext-gtk2-bin
pkgver=1.139.5.0
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
sha256sums=('d5a3190768b4bd43527e21b22c50da8466472acb1b59e953b6220086992c6e96')

package() {
    tar xvf "${srcdir}/data.tar.xz" -C "${pkgdir}/"
}
