# Maintainer:  eltonff


pkgname=cudatext-gtk2-bin
pkgver=1.236.0.5
pkgrel=1
pkgdesc="Cross-platform text editor, written in Lazarus"
arch=('x86_64')
url="https://cudatext.github.io"
license=('MPL2')
depends=('gtk2'
         'python')
provides=('cudatext')
conflicts=('cudatext')
options=('!strip')
source=("https://sourceforge.net/projects/cudatext/files/release/${pkgver}/cudatext_${pkgver}-${pkgrel}_gtk2_amd64.deb")
sha256sums=('f03b4c93edde88d00a32aedd4cbf69009770c7085800abec0590b4c8cd5bfc2a')

package() {
    tar xvf "${srcdir}/data.tar.zst" -C "${pkgdir}/"
}
