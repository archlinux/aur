# Maintainer:  eltonff


pkgname=cudatext-gtk2-bin
pkgver=1.219.1.0
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
sha256sums=('51fb294a0f478d4688850880e24268d702871efa4c0af018597e12a14eb6411b')

package() {
    tar xvf "${srcdir}/data.tar.zst" -C "${pkgdir}/"
}
