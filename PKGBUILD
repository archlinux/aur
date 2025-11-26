# Maintainer:  eltonff


pkgname=cudatext-gtk2-bin
pkgver=1.230.2.0
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
sha256sums=('b803f07fa4b18b397ba4f1f7e7713686f161901e54d379f79d080f58745d26b0')

package() {
    tar xvf "${srcdir}/data.tar.zst" -C "${pkgdir}/"
}
