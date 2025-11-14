# Maintainer:  eltonff


pkgname=cudatext-gtk2-bin
pkgver=1.230.0.0
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
sha256sums=('6672912035deec77366c5d0c5a4046e8460fcb3e22d2efd7350ad0d2649c402c')

package() {
    tar xvf "${srcdir}/data.tar.zst" -C "${pkgdir}/"
}
