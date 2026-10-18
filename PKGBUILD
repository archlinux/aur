# Maintainer:  eltonff


pkgname=cudatext-gtk2-bin
pkgver=1.237.3.0
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
sha256sums=('d614d7210680f8e1f8146653b4390377860b289d05e15fbd8f7e8a244a502e81')

package() {
    tar xvf "${srcdir}/data.tar.zst" -C "${pkgdir}/"
}
