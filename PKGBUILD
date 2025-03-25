# Maintainer:  eltonff


pkgname=cudatext-gtk2-bin
pkgver=1.222.3.1
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
sha256sums=('b03729df90c7c481bb4a713cdf4f15695bc0447a097b27dab0aa732f197cba53')

package() {
    tar xvf "${srcdir}/data.tar.zst" -C "${pkgdir}/"
}
