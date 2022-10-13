# Maintainer:  nissen22


pkgname=cudatext-gtk2-bin
pkgver=1.172.5.2
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
sha256sums=('5512d0cebcc7cb05d05c0000597d238846c8b8786941b331a41be5533a5af5ba')

package() {
    tar xvf "${srcdir}/data.tar.xz" -C "${pkgdir}/"
}
