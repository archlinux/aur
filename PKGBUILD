# Maintainer:  eltonff


pkgname=cudatext-gtk3-bin
pkgver=1.237.3.0
pkgrel=1
pkgdesc="Cross-platform text editor, written in Lazarus"
arch=('x86_64')
url="https://cudatext.github.io"
license=('MPL2')
depends=('gtk3'
         'python')
provides=('cudatext')
conflicts=('cudatext')
options=('!strip')
source=("https://sourceforge.net/projects/cudatext/files/release/${pkgver}/cudatext_${pkgver}-${pkgrel}_gtk3_amd64.deb")
sha256sums=('a624b7a01c42eb73e04a334c14a83aaf75c21ec64023000f27fad45decf3578d')

package() {
    tar xvf "${srcdir}/data.tar.zst" -C "${pkgdir}/"
}
