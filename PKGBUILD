# Maintainer:  eltonff


pkgname=cudatext-gtk2-bin
pkgver=1.234.3.0
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
sha256sums=('d418aea42bc99e550966b16c7ce711f9b171bc1ab19590f9355cb33637a82ed6')

package() {
    tar xvf "${srcdir}/data.tar.zst" -C "${pkgdir}/"
}
