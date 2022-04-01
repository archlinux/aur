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
sha256sums=('bafbbb8e7f6c16612df046966b71a0491b860f00bcf2f9c61fe93d568939c2aa')

package() {
  install -Dm775 usr/bin/* -g wheel -o ${USER} -t "${pkgdir}/usr/bin/"
  install -Dm644 usr/share/licenses/${pkgname}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
