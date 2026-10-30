# Maintainer:  eltonff


pkgname=cudatext-gtk2-bin
pkgver=1.238.0.0
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
sha256sums=('0f53e0bbd1d71247d97510eff85644e1839258e392f8cb79a0dca36deaaa6548')

package() {
    tar xvf "${srcdir}/data.tar.zst" -C "${pkgdir}/"
}
