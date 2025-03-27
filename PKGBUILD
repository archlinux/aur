# Maintainer:  eltonff


pkgname=cudatext-gtk2-bin
pkgver=1.222.5.0
pkgrel=1
pkgdesc="Cross-platform text editor, written in Lazarus"
arch=('x86_64')
url="http://uvviewsoft.com/cudatext"
license=('MPL2')
depends=('gtk2'
         'python')
provides=('cudatext')
conflicts=('cudatext')
options=('!strip')
source=("https://sourceforge.net/projects/cudatext/files/release/${pkgver}/cudatext_${pkgver}-${pkgrel}_gtk2_amd64.deb")
sha256sums=('ebb353c837515945a77e9c401653f33cbc19d9b45c60d4016a73c37b3b033574')

package() {
    tar xvf "${srcdir}/data.tar.zst" -C "${pkgdir}/"
}
