# Maintainer:  eltonff


pkgname=cudatext-gtk2-bin
pkgver=1.231.5.0
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
sha256sums=('4ce89a2ff4421b3ad939b0fa782bbc7a970b472e5dfaac923a98a4444c73358b')

package() {
    tar xvf "${srcdir}/data.tar.zst" -C "${pkgdir}/"
}
