# Maintainer:  nissen22


pkgname=cudatext-gtk2-bin
pkgver=1.182.0.1
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
sha256sums=('ad52586b98fe90949dd9ddea6ee72a09ba9d9dbbda53e67e3b88b6c0a338a8c4')

package() {
    tar xvf "${srcdir}/data.tar.xz" -C "${pkgdir}/"
}
