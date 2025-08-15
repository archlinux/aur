# Maintainer:  eltonff


pkgname=cudatext-gtk2-bin
pkgver=1.226.4.0
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
sha256sums=('20b996a5a485b69844dfd5c35d77fcec3c95c74011d4d648f40d739970fe988b')

package() {
    tar xvf "${srcdir}/data.tar.zst" -C "${pkgdir}/"
}
