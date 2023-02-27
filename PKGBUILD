# Maintainer:  nissen22


pkgname=cudatext-gtk2-bin
pkgver=1.186.0.0
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
sha256sums=('7f71f0a8f534632b15ff4707d6a4de9a504b4539f3121a2a70905d53efc4d17a')

package() {
    tar xvf "${srcdir}/data.tar.xz" -C "${pkgdir}/"
}
