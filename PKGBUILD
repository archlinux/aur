# Maintainer: Connor Etherington <connor@concise.cc>
# ---
pkgname=shell-headers
pkgver=1.0.1
pkgrel=1
pkgdesc='Scripts provide colorful terminal headers, meant to be placed in your shells rc file'
arch=(x86_64)
url="https://gitlab.com/qYp/${pkgname}"
license=('MIT')
depends=(lolcat)
makedepends=(git)                 
source=("https://gitlab.com/qYp/concise/-/raw/master/x86_64/${pkgname}-${pkgver}-${pkgrel}-$arch.pkg.tar.zst")
sha256sums=('6ac2c44aa499901e445e3eca9e73f6dbd4efb0ff77dd8230acfab53225c3aa6f')

package() {
  install -Dm775 usr/bin/* -g wheel -o ${USER} -t "${pkgdir}/usr/bin/"
  install -Dm644 usr/share/licenses/${pkgname}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
