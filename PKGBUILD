# Maintainer:  nissen22


pkgname=cudatext-gtk2-bin
pkgver=1.172.0.1
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
sha256sums=('4468c556ba56944e55bebff2870863b3176057cb837fee10fffba630b49c9a86')

package() {
    tar xvf "${srcdir}/data.tar.xz" -C "${pkgdir}/"
}
