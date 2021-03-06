# Maintainer:  nissen22


pkgname=cudatext-gtk2-bin
pkgver=1.128.0.2
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
sha256sums=('fb7b87152770fdf2e317f45934a1bc6e65ea1fcf560ea8c3346fd0fe6308784d')

package() {
    tar xvf "${srcdir}/data.tar.xz" -C "${pkgdir}/"
}
