# Maintainer: Connor Etherington <connor@concise.cc>
# ---
pkgname=shell-headers
pkgver=1.0.2
pkgrel=1
pkgdesc='Scripts provide colorful terminal headers, meant to be placed in your shells rc file'
arch=(x86_64)
url="https://gitlab.com/a4to/${pkgname}"
license=('MIT')
depends=(lolcat)
makedepends=(git)                 
source=("https://gitlab.com/a4to/concise/-/raw/master/x86_64/${pkgname}-${pkgver}-${pkgrel}-$arch.pkg.tar.zst")
sha256sums=('3899a504af2f2de17b2d31e7ad628642a4c625c8d52f7aeb968cb4d6542a5a34')

package() {
  install -Dm775 usr/bin/* -g wheel -o ${USER} -t "${pkgdir}/usr/bin/"
  install -Dm644 usr/share/licenses/${pkgname}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
