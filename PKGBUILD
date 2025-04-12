# Maintainer:  eltonff


pkgname=cudatext-gtk2-bin
pkgver=1.223.0.5
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
sha256sums=('bf9e937555be87fc92dc5f7b3181a61c1bc14b9db0d6b4c11196e781eb216da4')

package() {
    tar xvf "${srcdir}/data.tar.zst" -C "${pkgdir}/"
}
