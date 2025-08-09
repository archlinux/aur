# Maintainer:  eltonff


pkgname=cudatext-gtk2-bin
pkgver=1.226.1.1
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
sha256sums=('6d261205a0066ced983f41a1cff7bc700334de94b70c028578ac6b7ccea6338c')

package() {
    tar xvf "${srcdir}/data.tar.zst" -C "${pkgdir}/"
}
