# Maintainer:  nissen22


pkgname=cudatext-gtk2-bin
pkgver=1.202.0.1
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
sha256sums=('4d1bcceadf9b673eaf0ded44d52c227862742c2fa831d81a8bf3ec7a8fb19bc8')

package() {
    tar xvf "${srcdir}/data.tar.xz" -C "${pkgdir}/"
}
