# Maintainer:  eltonff


pkgname=cudatext-gtk2-bin
pkgver=1.223.6.0
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
sha256sums=('a9d52b9cb7ab78489b9939a6fc192bf45dffa00bbb8406c981cf1f0896d217d0')

package() {
    tar xvf "${srcdir}/data.tar.zst" -C "${pkgdir}/"
}
