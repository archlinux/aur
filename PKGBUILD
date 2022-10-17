# Maintainer:  nissen22


pkgname=cudatext-gtk2-bin
pkgver=1.173.0.0
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
sha256sums=('68150267507e85f05f8884b477998f4b1538e3bb72b4145b308b4f4b457a3700')

package() {
    tar xvf "${srcdir}/data.tar.xz" -C "${pkgdir}/"
}
