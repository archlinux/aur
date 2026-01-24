# Maintainer:  eltonff


pkgname=cudatext-gtk2-bin
pkgver=1.231.8.0
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
sha256sums=('fcfd2a09ec70f7efb9d3e942abc8670842cf72dc135ab408e3691552ad275bae')

package() {
    tar xvf "${srcdir}/data.tar.zst" -C "${pkgdir}/"
}
