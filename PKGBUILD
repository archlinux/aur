# Maintainer: Connor Etherington <connor@concise.cc>
# ---
pkgname=nav
pkgver=1.1
pkgrel=1
pkgdesc="A means of quick navigation through directories in the CLI"
arch=(any)
url="https://gitlab.com/a4to/${pkgname}"
license=('MIT')
depends=(dialog fzf)
source=(
  "https://concise.cc/pkg/${pkgname}-${pkgver}-${pkgrel}-$arch.pkg.tar.zst"
  "https://concise.cc/pkg/${pkgname}-${pkgver}-${pkgrel}-$arch.pkg.tar.zst.sig"
  )
sha512sums=(
  '2f72e9eae435226d5dd35376f260a26997565e53213178435e7ee6ada2b79856648640a649f7577b701ea2d220509ca254e41eebb0850bfbbec8c619b6f08630'
  '2a75d37bb3aeb99729b2abe70336034810168b56097b720e072559f3cc61f17d0ac6dc7ef1ddc8608a0955d72ddcdc76d1e0703cf259566aca18a6622fa35380'
  )
md5sums=(
  '89b6adcfc3604d94fa8a25e75d8279c5'
  '81232fe16aa84b884059bd8bc7b74ed0'
  )
validpgpkeys=('81BACEEBC3EA26E127166E4A819BB92A9A48160E')

package() {
    install -Dm644 usr/share/licenses/${pkgname}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm755 usr/bin/${pkgname} "${pkgdir}/usr/bin/${pkgname}"
}
