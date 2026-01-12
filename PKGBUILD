# Maintainer:  eltonff


pkgname=cudatext-gtk2-bin
pkgver=1.231.7.0
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
sha256sums=('5e9114ae3245d171e099a4a191ef54d9e4f73f3329ba156a4dab40cf36d94682')

package() {
    tar xvf "${srcdir}/data.tar.zst" -C "${pkgdir}/"
}
