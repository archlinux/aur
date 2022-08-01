# Maintainer: Connor Etherington <connor@concise.cc>
# ---
pkgname=snip
pkgver=0.1.0
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
  '3f10ed37d8c4c87d8142f576457790638a650ad6aae3b797da1f86ff944783d11a128e3242e13ef683d418a99688792b294a592b3442ad25985206cdddd87384'
  '36ce3b53ad2d728024dc1f76e2fa0ebec3052e795810dc2dca7ce17b9d03bcdb900dd7dbb6fcafc8c285c61b4bbfc3170d83b534590134b3451bb94a01d49550'
  )
md5sums=(
  'ee52085715b5c8628e7a87bccfc81392'
  '81ae5303c7fc4052deff879b4e450270'
  )
validpgpkeys=('81BACEEBC3EA26E127166E4A819BB92A9A48160E')

package() {  
    install -Dm644 usr/share/licenses/${pkgname}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm755 usr/bin/${pkgname} "${pkgdir}/usr/bin/${pkgname}"
}
