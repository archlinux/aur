# Maintainer:  eltonff


pkgname=cudatext-gtk2-bin
pkgver=1.232.0.1
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
sha256sums=('1de43089ef3a7078a59f965edf6b804cf3901be67cafe6e4ca1b9d48ad46c909')

package() {
    tar xvf "${srcdir}/data.tar.zst" -C "${pkgdir}/"
}
