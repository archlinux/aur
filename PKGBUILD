# Maintainer: Connor Etherington <connor@concise.cc>
# ---
_pkgname=BetterBin
pkgname=betterbin
pkgver=1.0.r70
pkgrel=1
pkgdesc='Various useful shell scripts to increace productivity and efficiency in your workflow'
arch=(x86_64)
url="https://gitlab.com/qYp/${pkgname}"
license=('MIT')
depends=()
makedepends=(git)                 
source=(
  'https://gitlab.com/qyp/concise/-/raw/master/x86_64/betterbin-1.0.r70-1-x86_64.pkg.tar.zst'
  'https://gitlab.com/qyp/concise/-/raw/master/x86_64/betterbin-1.0.r70-1-x86_64.pkg.tar.zst.sig'
  )
sha256sums=(
  'e0c8db1384655a209a3eb76c7d6c7633b118d46989ef1b122160726fa765c451'
  '43c070615d81d4e4f0546934688dc0a1a9af0f3aa0b52a14c621d50174518d62'
)

package() {
  install -Dm775 ${srcdir}/usr/bin/* -g wheel -o ${USER} -t "${pkgdir}/usr/bin/"
  install -Dm644 ${srcdir}/usr/share/licenses/${pkgname}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 ${srcdir}/usr/share/doc/${pkgname}/* -t "${pkgdir}/usr/share/doc/${pkgname}/"
}
