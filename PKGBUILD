# Maintainer:  nissen22


pkgname=cudatext-gtk2-bin
pkgver=1.155.3.0
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
sha256sums=('fabfab1db840d5d4254e9c6525e2782ace2d3ec98e989a01cb4fb6ad39342d13')

package() {
    tar xvf "${srcdir}/data.tar.xz" -C "${pkgdir}/"
}
