# Maintainer:  eltonff


pkgname=cudatext-gtk2-bin
pkgver=1.234.0.2
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
sha256sums=('816f1cbba4097575c7418dc29195827687f52d1be05235d79be2dadc82be341a')

package() {
    tar xvf "${srcdir}/data.tar.zst" -C "${pkgdir}/"
}
