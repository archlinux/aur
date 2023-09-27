# Maintainer:  nissen22


pkgname=cudatext-gtk2-bin
pkgver=1.199.0.0
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
source=("http://www.uvviewsoft.com/cudatext/files_linux/cudatext_${pkgver}-${pkgrel}_gtk2_amd64.deb")
sha256sums=('645de4019e6ac6af73fd7f5ea7acbf4d19b81d9edf4080a1f754b8b1075b973f')

package() {
    tar xvf "${srcdir}/data.tar.xz" -C "${pkgdir}/"
}
