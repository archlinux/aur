# Maintainer:  nissen22


pkgname=cudatext-gtk2-bin
pkgver=1.111.0.2
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
sha256sums=('d2952268e36c47f140654b6b0ffa7f90570ee20cefa01030e906b12d593e837f')

package() {
    tar xvf "${srcdir}/data.tar.xz" -C "${pkgdir}/"
}
