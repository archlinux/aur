# Maintainer:  nissen22


pkgname=cudatext-gtk2-bin
pkgver=1.152.0.6
pkgrel=1
pkgdesc="Cross-platform text editor, written in Lazarus"
arch=('x86_64')
url="http://uvviewsoft.com/cudatext"
license=('MPL2')
depends=('gtk2'
         'python')
provides=('cudatext')
conflicts=('cudatext-qt5-bin')
options=('!strip')
source=("http://www.uvviewsoft.com/cudatext/files_linux/cudatext_${pkgver}-${pkgrel}_gtk2_amd64.deb")
sha256sums=('a666028f744a20a3d9db9f5cbcfb908e27fa71baf7d0bca93f447e686d25c847')

package() {
    tar xvf "${srcdir}/data.tar.xz" -C "${pkgdir}/"
}
