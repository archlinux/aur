# Maintainer:  eltonff


pkgname=cudatext-gtk2-bin
pkgver=1.240.0.6
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
sha256sums=('b4c45b0bb0500a48c0b0ddb062df32dc3d1e56148cd591d311b2dc1bd5e1873e')

package() {
    tar xvf "${srcdir}/data.tar.zst" -C "${pkgdir}/"
}
