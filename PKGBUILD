# Maintainer:  eltonff


pkgname=cudatext-gtk2-bin
pkgver=1.234.6.0
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
sha256sums=('5f10b32848f48a93c107f47fb394982454c5d648fc6bc71fd9f6317cf8ecb8c9')

package() {
    tar xvf "${srcdir}/data.tar.zst" -C "${pkgdir}/"
}
