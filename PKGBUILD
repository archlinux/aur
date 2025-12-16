# Maintainer:  eltonff


pkgname=cudatext-gtk2-bin
pkgver=1.231.0.0
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
sha256sums=('f20c93d8d146b7e2e5712b471886d58383d566e6d71f39a1da4b1b37479c9ea2')

package() {
    tar xvf "${srcdir}/data.tar.zst" -C "${pkgdir}/"
}
