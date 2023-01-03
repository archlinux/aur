# Maintainer:  nissen22


pkgname=cudatext-gtk2-bin
pkgver=1.181.0.0
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
sha256sums=('749602e1b43f6a968874a8fa51b7b5faebd1afe2102ec9f0294b32dd255935d5')

package() {
    tar xvf "${srcdir}/data.tar.xz" -C "${pkgdir}/"
}
