# Maintainer:  eltonff


pkgname=cudatext-gtk2-bin
pkgver=1.220.5.0
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
sha256sums=('b851382bdf78ddf83e19543cf2e01514d190379d33b65b5f5d3702796d565d9f')

package() {
    tar xvf "${srcdir}/data.tar.zst" -C "${pkgdir}/"
}
