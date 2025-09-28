# Maintainer:  eltonff


pkgname=cudatext-gtk2-bin
pkgver=1.228.1.0
pkgrel=1
pkgdesc="Cross-platform text editor, written in Lazarus"
arch=('x86_64')
url="https://cudatext.github.io"
license=('MPL2')
depends=('gtk2'
         'python')
provides=('cudatext')
conflicts=('cudatext')
options=('!strip')
source=("https://sourceforge.net/projects/cudatext/files/release/${pkgver}/cudatext_${pkgver}-${pkgrel}_gtk2_amd64.deb")
sha256sums=('cde486f9b16ca1cca16a9b471a913977ddc1ecf46cf56ea62e5d67969f26f946')

package() {
    tar xvf "${srcdir}/data.tar.zst" -C "${pkgdir}/"
}
