# Maintainer:  nissen22


pkgname=cudatext-gtk2-bin
pkgver=1.115.0.1
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
sha256sums=('c1ab799e7397331cc213a42a197598eb99e5a9b041c1948ca02ca025cfba3e5c')

package() {
    tar xvf "${srcdir}/data.tar.xz" -C "${pkgdir}/"
}
