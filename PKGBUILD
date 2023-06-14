# Maintainer:  nissen22


pkgname=cudatext-gtk2-bin
pkgver=1.195.0.5
pkgrel=1
pkgdesc="Cross-platform text editor, written in Lazarus"
arch=('x86_64')
url="http://uvviewsoft.com/cudatext"
license=('MPL2')
depends=('gtk2'
         'python')
provides=('cudatext')
conflicts=('cudatext')
options=('!strip')
source=("http://www.uvviewsoft.com/cudatext/files_linux/cudatext_${pkgver}-${pkgrel}_gtk2_amd64.deb")
sha256sums=('4fe0bb4929ca233700d705eef7e0e9522017705dab37e0884ef2c9dacda592da')

package() {
    tar xvf "${srcdir}/data.tar.xz" -C "${pkgdir}/"
}
