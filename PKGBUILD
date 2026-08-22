# Maintainer:  eltonff


pkgname=cudatext-gtk3-bin
pkgver=1.236.0.4
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
sha256sums=('6232cb257643f65337e30832a2f157030aa572af10fd92c500a40466c0bce518')

package() {
    tar xvf "${srcdir}/data.tar.zst" -C "${pkgdir}/"
}
