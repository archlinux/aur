# Maintainer:  eltonff


pkgname=cudatext-gtk2-bin
pkgver=1.226.7.0
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
sha256sums=('e51a00ccb574701eb87f32dcef381d901250376612bab31596b158161556f557')

package() {
    tar xvf "${srcdir}/data.tar.zst" -C "${pkgdir}/"
}
