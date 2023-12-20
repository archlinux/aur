# Maintainer:  nissen22


pkgname=cudatext-gtk2-bin
pkgver=1.205.5.2
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
sha256sums=('6febfc3e0e57789238b985fb4e352da7873ffe2fd07c7c4df5da0a8cd1babfc3')

package() {
    tar xvf "${srcdir}/data.tar.xz" -C "${pkgdir}/"
}
