# Maintainer:  eltonff


pkgname=cudatext-gtk2-bin
pkgver=1.220.0.4
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
sha256sums=('812af0e89d1b9137e62f30f3d7fdb3de2f33d205ef010aa234b904debb26ffc5')

package() {
    tar xvf "${srcdir}/data.tar.zst" -C "${pkgdir}/"
}
