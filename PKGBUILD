# Maintainer: Connor Etherington <connor@concise.cc>
# ---
pkgname=snip
pkgver=1.1.0
pkgrel=1
pkgdesc="A simple snippet manager for your predefined Ultisnips Snippet Directory"
arch=(any)
url="https://gitlab.com/a4to/${pkgname}"
license=('MIT')
depends=(neovim)
source=(
  "https://concise.cc/pkg/${pkgname}-${pkgver}-${pkgrel}-$arch.pkg.tar.zst"
  "https://concise.cc/pkg/${pkgname}-${pkgver}-${pkgrel}-$arch.pkg.tar.zst.sig"
  )
sha512sums=(
  '50cabda0468845b3287d77cd904ae4c1f97821abe60c61da87d7bf2f3cf8e189b5115fd110a8ad62f29b89f5ac9c4b8a8ba67b5c68bda78bd146f0b827bdfe1b'
  'b5db73133a0bdb638faaf883f562ab651b11ccc02fb3235082a3427a492a37bd2f24d2c34de77bff3459209765b09928d322a2a05d28d528536a92200fcff164'
  )
md5sums=(
  '120c1d825140a63c0eb7863634ca5045'
  'a01fdf1fc695c2528800054306fb61ce'
  )
validpgpkeys=('81BACEEBC3EA26E127166E4A819BB92A9A48160E')

package() {
    install -Dm644 usr/share/licenses/${pkgname}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm755 usr/bin/${pkgname} "${pkgdir}/usr/bin/${pkgname}"
}
