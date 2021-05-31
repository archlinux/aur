# Maintainer:  nissen22


pkgname=cudatext-gtk2-bin
pkgver=1.133.5.5
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
sha256sums=('3e289a7e2112736ca9748ab41066dc61dd693f33b009255ed52da79e7c16e0c8')

package() {
    tar xvf "${srcdir}/data.tar.xz" -C "${pkgdir}/"
}
