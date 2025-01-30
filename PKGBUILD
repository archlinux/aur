# Maintainer:  eltonff


pkgname=cudatext-gtk2-bin
pkgver=1.221.0.0
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
sha256sums=('bad841564035b3c1702f415ae4546892b1f77424ae270f6858520f3e7c315b9c')

package() {
    tar xvf "${srcdir}/data.tar.zst" -C "${pkgdir}/"
}
