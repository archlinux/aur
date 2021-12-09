# Maintainer:  nissen22


pkgname=cudatext-gtk2-bin
pkgver=1.150.1.1
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
sha256sums=('1f21d75b1d41dae5876c27bbc449474f2331dc01b6ec11330588b37a636eac51')

package() {
    tar xvf "${srcdir}/data.tar.xz" -C "${pkgdir}/"
}
