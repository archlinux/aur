# Maintainer:  eltonff


pkgname=cudatext-gtk2-bin
pkgver=1.236.0.3
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
sha256sums=('1da6dd2f678b2c0c401982193d3ecabaa1aebfba3bea4f7681a0ff095ce47878')

package() {
    tar xvf "${srcdir}/data.tar.zst" -C "${pkgdir}/"
}
