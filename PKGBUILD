# Maintainer:  eltonff


pkgname=cudatext-gtk2-bin
pkgver=1.229.0.0
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
sha256sums=('41347d1f6c0626f6bc1d439b65b7e842e93dc8de45ae9fc83bec480a8f1c5e30')

package() {
    tar xvf "${srcdir}/data.tar.zst" -C "${pkgdir}/"
}
