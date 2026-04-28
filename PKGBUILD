# Maintainer:  eltonff


pkgname=cudatext-gtk2-bin
pkgver=1.234.0.4
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
sha256sums=('c7d715634b181270dca63dbce04c75bcd98be9d5537f04d75cd6569aa5eeef84')

package() {
    tar xvf "${srcdir}/data.tar.zst" -C "${pkgdir}/"
}
