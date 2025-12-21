# Maintainer:  eltonff


pkgname=cudatext-gtk2-bin
pkgver=1.231.1.0
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
sha256sums=('838a1a8d9d47eb88efa0e5ed56883f93ea7a7df44623a10992b68423d27f8848')

package() {
    tar xvf "${srcdir}/data.tar.zst" -C "${pkgdir}/"
}
