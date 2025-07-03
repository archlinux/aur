# Maintainer:  eltonff


pkgname=cudatext-gtk2-bin
pkgver=1.225.0.0
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
sha256sums=('a00094a5f681eeb5338c5ccc08bd56ac7d217c8f5f62741c6998dff33b28382e')

package() {
    tar xvf "${srcdir}/data.tar.zst" -C "${pkgdir}/"
}
