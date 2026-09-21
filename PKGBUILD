# Maintainer:  eltonff


pkgname=cudatext-gtk2-bin
pkgver=1.237.0.2
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
sha256sums=('debb807fa1aeed743798a125f0237f6c5804455120cef57c71e09984d610cf21')

package() {
    tar xvf "${srcdir}/data.tar.zst" -C "${pkgdir}/"
}
