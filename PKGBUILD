# Maintainer:  nissen22


pkgname=cudatext-gtk2-bin
pkgver=1.153.5.0
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
sha256sums=('45fd3ff88403050be3511afb830f18ef2a3448b014ae9df53ca3d4f928cae150')

package() {
    tar xvf "${srcdir}/data.tar.xz" -C "${pkgdir}/"
}
