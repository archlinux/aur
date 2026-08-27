# Maintainer:  eltonff


pkgname=cudatext-gtk3-bin
pkgver=1.236.0.5
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
sha256sums=('c7f20931f7ca395927b79c6a6b329fe4345656ea2bbd415769801f54ef7e8429')

package() {
    tar xvf "${srcdir}/data.tar.zst" -C "${pkgdir}/"
}
