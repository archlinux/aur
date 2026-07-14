# Maintainer:  eltonff


pkgname=cudatext-gtk3-bin
pkgver=1.235.0.0
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
sha256sums=('a06a335785a82fb9f303018bb8720ff8d5d5db45d3bee9f50597700c0f374118')

package() {
    tar xvf "${srcdir}/data.tar.zst" -C "${pkgdir}/"
}
