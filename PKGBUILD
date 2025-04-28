# Maintainer:  eltonff


pkgname=cudatext-gtk2-bin
pkgver=1.223.5.2
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
sha256sums=('dfbe44d225a307c26c3378c39ba769224f66c9be37965b5ea3a42c09586da35b')

package() {
    tar xvf "${srcdir}/data.tar.zst" -C "${pkgdir}/"
}
