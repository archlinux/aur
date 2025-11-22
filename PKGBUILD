# Maintainer:  eltonff


pkgname=cudatext-gtk2-bin
pkgver=1.230.1.0
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
sha256sums=('7222cf53705cd9d10e3f482f690cfd889df0c9bdc55f90fa4d7b6c0a8e4fd8f3')

package() {
    tar xvf "${srcdir}/data.tar.zst" -C "${pkgdir}/"
}
