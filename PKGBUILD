# Maintainer:  eltonff


pkgname=cudatext-gtk3-bin
pkgver=1.235.0.3
pkgrel=1
pkgdesc="Cross-platform text editor, written in Lazarus"
arch=('x86_64')
url="https://cudatext.github.io"
license=('MPL2')
depends=('gtk3'
         'python')
provides=('cudatext')
conflicts=('cudatext')
options=('!strip')
source=("https://sourceforge.net/projects/cudatext/files/release/${pkgver}/cudatext_${pkgver}-${pkgrel}_gtk3_amd64.deb")
sha256sums=('a83330357caf8fd32881333aaeffe5e1d8491395f036260ac0b33f311041261e')

package() {
    tar xvf "${srcdir}/data.tar.zst" -C "${pkgdir}/"
}
