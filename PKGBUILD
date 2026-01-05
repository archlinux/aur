# Maintainer:  eltonff


pkgname=cudatext-gtk2-bin
pkgver=1.231.5.4
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
sha256sums=('4e27f52baeaee4796e358ab6fdc8e2d7a740c6f87791986c5663303cb6a0e89b')

package() {
    tar xvf "${srcdir}/data.tar.zst" -C "${pkgdir}/"
}
