# Maintainer:  eltonff


pkgname=cudatext-gtk2-bin
pkgver=1.234.4.1
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
sha256sums=('29c61fd5f5c5021286cd7b5e2bea6927f0eb15deccf1d9f8090aaa83c596fd5b')

package() {
    tar xvf "${srcdir}/data.tar.zst" -C "${pkgdir}/"
}
