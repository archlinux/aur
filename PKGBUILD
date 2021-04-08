# Maintainer:  nissen22


pkgname=cudatext-gtk2-bin
pkgver=1.130.0.0
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
sha256sums=('94a13c5bd86b364c1f87fc3cdee4fa8d9aefc2088398170e99abf038f2112140')

package() {
    tar xvf "${srcdir}/data.tar.xz" -C "${pkgdir}/"
}
