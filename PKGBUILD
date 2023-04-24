# Maintainer:  nissen22


pkgname=cudatext-gtk2-bin
pkgver=1.191.5.0
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
sha256sums=('a2a3bb5ee17c18c47f028e29e2e7c6a234268bd570312574d65340529a9ef62f')

package() {
    tar xvf "${srcdir}/data.tar.xz" -C "${pkgdir}/"
}
