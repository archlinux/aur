# Maintainer:  eltonff


pkgname=cudatext-gtk2-bin
pkgver=1.230.0.0
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
sha256sums=('3676899908a1e0e97457b35280cfe2695c307325129bae86c984c8ad76bd5eb9')

package() {
    tar xvf "${srcdir}/data.tar.zst" -C "${pkgdir}/"
}
