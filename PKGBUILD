# Maintainer:  eltonff


pkgname=cudatext-gtk2-bin
pkgver=1.232.0.4
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
sha256sums=('95f8bdd9dd8eba6a54d90a7e2d7b2f1573dbecf28684d7f0ba3953b7b1945bd8')

package() {
    tar xvf "${srcdir}/data.tar.zst" -C "${pkgdir}/"
}
