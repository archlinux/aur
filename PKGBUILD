# Maintainer:  eltonff


pkgname=cudatext-gtk3-bin
pkgver=1.237.1.1
pkgrel=1
pkgdesc="Cross-platform text editor, written in Lazarus"
arch=('x86_64')
url="https://cudatext.github.io"
license=('MPL2')
depends=('gtk3'
         'python')
provides=('cudatext')
conflicts=('cudatext')
options=('!strip')
source=("https://sourceforge.net/projects/cudatext/files/release/${pkgver}/cudatext_${pkgver}-${pkgrel}_gtk3_amd64.deb")
sha256sums=('025fb96c90461973cc0043e244db11ec0e12facfca87f54644a4cf986d7fa66e')

package() {
    tar xvf "${srcdir}/data.tar.zst" -C "${pkgdir}/"
}
