# Maintainer:  eltonff


pkgname=cudatext-gtk2-bin
pkgver=1.220.0.0
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
sha256sums=('d94febc666b7cd52c7d24bb34f255fcfc04ebea207c75180ea91123dc19cba5a')

package() {
    tar xvf "${srcdir}/data.tar.zst" -C "${pkgdir}/"
}
