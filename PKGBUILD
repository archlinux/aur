# Maintainer:  eltonff


pkgname=cudatext-gtk2-bin
pkgver=1.232.1.0
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
sha256sums=('9275a27602625027e42dd862801959f52f06f9886f4e3cd3eed2f21ad40854f5')

package() {
    tar xvf "${srcdir}/data.tar.zst" -C "${pkgdir}/"
}
