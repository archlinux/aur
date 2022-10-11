# Maintainer:  nissen22


pkgname=cudatext-gtk2-bin
pkgver=1.172.5.1
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
sha256sums=('830ad4d4eb243757013c7195bc8fb3094009169e1191387d75e334748f3162fc')

package() {
    tar xvf "${srcdir}/data.tar.xz" -C "${pkgdir}/"
}
