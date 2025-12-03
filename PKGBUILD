# Maintainer:  eltonff


pkgname=cudatext-gtk2-bin
pkgver=1.230.4.0
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
sha256sums=('23c430e4e8ba0f0b8a8f650f8742da1b0479af4b10381490f8b3fb86b8669fb8')

package() {
    tar xvf "${srcdir}/data.tar.zst" -C "${pkgdir}/"
}
