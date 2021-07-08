# Maintainer:  nissen22


pkgname=cudatext-gtk2-bin
pkgver=1.137.0.0
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
sha256sums=('29d719d7b1f16cb5e3f92e8a0a19fb670ed684b98e1616b1488e10d6a27bf075')

package() {
    tar xvf "${srcdir}/data.tar.xz" -C "${pkgdir}/"
}
