# Maintainer:  nissen22


pkgname=cudatext-gtk2-bin
pkgver=1.159.2.0
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
sha256sums=('a14f41798b9aab3f76eb2765f0b441c455ecc287598338033cc107db1f9b0dee')

package() {
    tar xvf "${srcdir}/data.tar.xz" -C "${pkgdir}/"
}
