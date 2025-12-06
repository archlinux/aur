# Maintainer:  eltonff


pkgname=cudatext-gtk2-bin
pkgver=1.230.5.0
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
sha256sums=('ee213b9a304428f468c20081de323e0f88dffc2e85303b7e4f53e20fc83945e9')

package() {
    tar xvf "${srcdir}/data.tar.zst" -C "${pkgdir}/"
}
