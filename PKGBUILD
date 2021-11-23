# Maintainer:  nissen22


pkgname=cudatext-gtk2-bin
pkgver=1.149.3.0
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
sha256sums=('fe86d07701bb70a9eceec76bbe5e264e46386c6821a042e7ea75936a5bbe7190')

package() {
    tar xvf "${srcdir}/data.tar.xz" -C "${pkgdir}/"
}
