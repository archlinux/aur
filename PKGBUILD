# Maintainer:  eltonff


pkgname=cudatext-gtk2-bin
pkgver=1.229.5.0
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
sha256sums=('0686997aae5e4925d62c4e5a44706741f11c5e434d3efcabe0fa807eb28f7efa')

package() {
    tar xvf "${srcdir}/data.tar.zst" -C "${pkgdir}/"
}
