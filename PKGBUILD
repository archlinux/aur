# Maintainer:  eltonff


pkgname=cudatext-gtk2-bin
pkgver=1.222.0.0
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
sha256sums=('72535c306a92cc8c3f59a2b9f7167abe3e7af3b135ec6dceef03d1aae6766d22')

package() {
    tar xvf "${srcdir}/data.tar.zst" -C "${pkgdir}/"
}
