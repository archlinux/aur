# Maintainer:  eltonff


pkgname=cudatext-gtk2-bin
pkgver=1.234.3.1
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
sha256sums=('b382f96497a3cf1b1545bd837c253d65d7d1623dd9443f4a62aafca626ebed17')

package() {
    tar xvf "${srcdir}/data.tar.zst" -C "${pkgdir}/"
}
