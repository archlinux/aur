# Maintainer:  eltonff


pkgname=cudatext-gtk2-bin
pkgver=1.221.5.2
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
sha256sums=('312b946d28dc73dfeb43808df54d6bd398ea47d4d02edd9808d359192f6362a2')

package() {
    tar xvf "${srcdir}/data.tar.zst" -C "${pkgdir}/"
}
