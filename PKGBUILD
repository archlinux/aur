# Maintainer:  nissen22


pkgname=cudatext-gtk2-bin
pkgver=1.158.2.0
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
sha256sums=('7f28fdaa36ac0981e1feeb6c58c3bf3fab2e07bd4efca73946890fe8ee743c5f')

package() {
    tar xvf "${srcdir}/data.tar.xz" -C "${pkgdir}/"
}
