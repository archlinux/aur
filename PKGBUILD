# Maintainer: Connor Etherington <connor@concise.cc>
# ---
_pkgname=BetterBin
pkgname=betterbin
pkgver=1.0.r83
pkgrel=1
pkgdesc='Various useful shell scripts to increace productivity and efficiency in your workflow'
arch=(x86_64)
url="https://gitlab.com/qYp/${pkgname}"
license=('MIT')
depends=()
makedepends=(git)                 
source=("https://gitlab.com/qYp/concise/-/raw/master/x86_64/${pkgname}-${pkgver}-${pkgrel}-$arch.pkg.tar.zst")
sha256sums=('6f474ef841620b36e6cc45d85db671d581b63e597e55431af83f50166c4db475')

package() {
  install -Dm775 usr/bin/* -g wheel -o ${USER} -t "${pkgdir}/usr/bin/"
  install -Dm644 usr/share/licenses/${pkgname}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 usr/share/doc/${pkgname}/* -t "${pkgdir}/usr/share/doc/${pkgname}/"
}
