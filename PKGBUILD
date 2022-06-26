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
  'fee219ee461d4fe453fdfa7df9ee4283ade43d05f509cb20c166e3c75d3e38a1acbf707b75635bf34198b8cb8c2be1d568b97004f941d32ee67d3754a7f5e062'
  '9b6af951b6a4fe72b62961e6e4dc71cd1b3066509ef15c590195992731adaf8ce378b959bf1faecfac92a0e853052f5b6ef5e77ad8e333e680f39b47b7dc58b1'
  )
md5sums=(
  '9bfba5a6293d0d38f670bff5cb743c15'
  '843e68c1de8199e8224a6215bff2b38d'
  )
validpgpkeys=('81BACEEBC3EA26E127166E4A819BB92A9A48160E')

package() {
    install -Dm755 usr/bin/${pkgname} "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 usr/share/licenses/${pkgname}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 usr/share/man/man1/${pkgname}.1.gz "${pkgdir}/usr/share/man/man1/${pkgname}.1.gz"
}
