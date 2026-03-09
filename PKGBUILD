# Maintainer:  eltonff


pkgname=cudatext-gtk2-bin
pkgver=1.233.0.0
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
sha256sums=('80f298d72b31e16cf4429cac080c1d65ff830c4a3320fc68df5ea4c6e367857f')

package() {
    tar xvf "${srcdir}/data.tar.zst" -C "${pkgdir}/"
}
