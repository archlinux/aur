# Maintainer:  eltonff


pkgname=cudatext-gtk2-bin
pkgver=1.226.0.0
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
sha256sums=('d648fc93e577d92a123583d6d525c5ac8666ebc6397a87dbf04568d7cb4d9662')

package() {
    tar xvf "${srcdir}/data.tar.zst" -C "${pkgdir}/"
}
