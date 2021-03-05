# Maintainer:  nissen22


pkgname=cudatext-gtk2-bin
pkgver=1.128.0.0
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
sha256sums=('651ced8bff0c884b7177924d23b9cadb5313a86c559ed2cb95962334bc7a0e29')

package() {
    tar xvf "${srcdir}/data.tar.xz" -C "${pkgdir}/"
}
