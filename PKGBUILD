# Maintainer:  nissen22


pkgname=cudatext-gtk2-bin
pkgver=1.194.4.0
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
sha256sums=('71836a8b6ce90ac4823c06fb6d819f009fa855c7b699461e4171ee7687eff87a')

package() {
    tar xvf "${srcdir}/data.tar.xz" -C "${pkgdir}/"
}
