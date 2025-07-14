# Maintainer:  eltonff


pkgname=cudatext-gtk2-bin
pkgver=1.226.0.0
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
sha256sums=('0ed63ce83a0944d32ede3aa7da3d6074f97197381feeca1db8dd1179e482f7f9')

package() {
    tar xvf "${srcdir}/data.tar.zst" -C "${pkgdir}/"
}
