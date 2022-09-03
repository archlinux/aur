# Maintainer:  nissen22


pkgname=cudatext-gtk2-bin
pkgver=1.170.0.0
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
sha256sums=('494e60aaf1cc1ca2cf5c6eea7910e125eacf197004ba5e2b11731f6f2bcc4819')

package() {
    tar xvf "${srcdir}/data.tar.xz" -C "${pkgdir}/"
}
