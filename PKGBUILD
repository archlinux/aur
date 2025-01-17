# Maintainer:  eltonff


pkgname=cudatext-gtk2-bin
pkgver=1.220.6.1
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
sha256sums=('c20a73f94dc7302cfa611c6c53f9fbf8ad4aa10018356fbee1d8be58167d293c')

package() {
    tar xvf "${srcdir}/data.tar.zst" -C "${pkgdir}/"
}
