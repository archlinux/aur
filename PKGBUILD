# Maintainer: Connor Etherington <connor@concise.cc>
# ---
pkgname=qcopy
pkgver=1.5
pkgrel=1
pkgdesc="Easily save important snippets such as passwords for quick access copying at any point"
arch=(any)
url="https://gitlab.com/a4to/${pkgname}"
license=('MIT')
depends=(fzf dialog xsel bat)
install="qcopy.install"
source=(
  "https://concise.cc/pkg/${pkgname}-${pkgver}-${pkgrel}-$arch.pkg.tar.zst"
  "https://concise.cc/pkg/${pkgname}-${pkgver}-${pkgrel}-$arch.pkg.tar.zst.sig"
  )
sha512sums=(
  '85280ecbe9a8a41d618e2d4d56eae5b0b433345d14ff6224457815f1fc170d0e616f1143d6458979a1cdd0d66055e546f5ed7f74092a1a068a34fd20e73c3b2c'
  'ea76b15d826769d1bdd0434132030304445304456cb9577d967054353145ae2e4ee4c6ab61589467510e25801997673e7813face781d1e207ccf9b290039f725'
  )
md5sums=(
  '1fb1bb47ce011b916457043ac94cbe6c'
  '7c4679261ec1dade3d5faf93518038f8'
  )
validpgpkeys=('9A1F3F41DDA55A60331CB8DD3714CB0967D15980')

package() {
    install -Dm755 usr/bin/${pkgname} "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 usr/share/licenses/${pkgname}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 usr/share/man/man1/${pkgname}.1.gz "${pkgdir}/usr/share/man/man1/${pkgname}.1.gz"
}
