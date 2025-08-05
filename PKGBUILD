# Maintainer:  eltonff


pkgname=cudatext-gtk2-bin
pkgver=1.226.1.0
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
sha256sums=('84f11408ee29f7e4d009e3a2644732a8b2c78724925b35ad7da740cbaecf00ac')

package() {
    tar xvf "${srcdir}/data.tar.zst" -C "${pkgdir}/"
}
