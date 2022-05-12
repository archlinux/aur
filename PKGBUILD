# Maintainer:  nissen22


pkgname=cudatext-gtk2-bin
pkgver=1.164.0.1
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
sha256sums=('99384c2d4499476edd2a1d2ecce7c75049a49208ca92e5b7bf4d6100af4c8ed2')

package() {
    tar xvf "${srcdir}/data.tar.xz" -C "${pkgdir}/"
}
