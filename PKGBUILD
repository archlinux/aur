# Maintainer:  eltonff


pkgname=cudatext-gtk2-bin
pkgver=1.228.1.0
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
sha256sums=('a15aac227b3cb19c3ac09083ed39b43a6c9fcb8bb17c5bb2bd54b9d237437a35')

package() {
    tar xvf "${srcdir}/data.tar.zst" -C "${pkgdir}/"
}
