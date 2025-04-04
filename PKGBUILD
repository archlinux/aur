# Maintainer:  eltonff


pkgname=cudatext-gtk2-bin
pkgver=1.223.0.0
pkgrel=1
pkgdesc="Cross-platform text editor, written in Lazarus"
arch=('x86_64')
url="http://uvviewsoft.com/cudatext"
license=('MPL2')
depends=('gtk2'
         'python')
provides=('cudatext')
conflicts=('cudatext')
options=('!strip')
source=("https://sourceforge.net/projects/cudatext/files/release/${pkgver}/cudatext_${pkgver}-${pkgrel}_gtk2_amd64.deb")
sha256sums=('e959965c4f0d6db6601d30bb8dc7564be881bbde82cd66bcd5caf2984f8ac616')

package() {
    tar xvf "${srcdir}/data.tar.zst" -C "${pkgdir}/"
}
