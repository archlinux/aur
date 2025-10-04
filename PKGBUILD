# Maintainer:  eltonff


pkgname=cudatext-gtk2-bin
pkgver=1.228.3.1
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
sha256sums=('3667c549dee8f955875a3420dd4dbdfbecbee2b1c98af5c14472407b84fe9c30')

package() {
    tar xvf "${srcdir}/data.tar.zst" -C "${pkgdir}/"
}
