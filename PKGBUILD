# Maintainer:  nissen22


pkgname=cudatext-gtk2-bin
pkgver=1.134.0.0
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
sha256sums=('983c06f209ceb66f512ffdd20d19334958d60110eb94a18179dcd03c20fd4c19')

package() {
    tar xvf "${srcdir}/data.tar.xz" -C "${pkgdir}/"
}
