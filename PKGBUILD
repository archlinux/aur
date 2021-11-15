# Maintainer:  nissen22


pkgname=cudatext-gtk2-bin
pkgver=1.149.0.0
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
sha256sums=('7e6bcb7642fc8048c36e38dcf5478a8d9f96c5c9468b8c5a5a537ba8ee86c681')

package() {
    tar xvf "${srcdir}/data.tar.xz" -C "${pkgdir}/"
}
