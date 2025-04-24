# Maintainer:  eltonff


pkgname=cudatext-gtk2-bin
pkgver=1.223.5.1
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
sha256sums=('613a48676831e8a5337ee9edc6cf636d1af89cb439402fda590e9a32ad0a873c')

package() {
    tar xvf "${srcdir}/data.tar.zst" -C "${pkgdir}/"
}
