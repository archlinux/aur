# Maintainer: Connor Etherington <connor@concise.cc>
# ---
pkgname=snip
pkgver=0.1.2
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
  '3d1ecccf20eb8e7b8d17275cb5466c94c58911d82e0bef073bbc991f3137807774a5c1aad67e903fe84f8728a8d20e37db419ec54efa1334b7a851c68a7f64af'
  '74d05754a78c9e909d854e2c952a326cf50d21e5d7376c8ab056f5aba5cff1d3dbbc119bef0500226685604701f3d6b161914729b3601315ee7ff9b53391b485'
  )
md5sums=(
  'bd2b39b6234352b6462b2e30ecfa70de'
  '7e17c1b932f974821710d187f325a0cc'
  )
validpgpkeys=('81BACEEBC3EA26E127166E4A819BB92A9A48160E')

package() {
    install -Dm644 usr/share/licenses/${pkgname}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm755 usr/bin/${pkgname} "${pkgdir}/usr/bin/${pkgname}"
}
