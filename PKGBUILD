# Maintainer: Connor Etherington <connor@concise.cc>
# ---
pkgname=snip
pkgver=1.1.2
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
  '63c595077cbbb13304af7f5946db2a43b458f4bd8f60b15d5ec8a1e0b80211eec9a8b7e751f8cfe01cf1a25f3af7464261bb2c4baee32fbd6dc6bf1d41e8c5dd'
  'ab70b3e3ca83bcab91a8e2a371a8d622ce45d6a4ffcc4a3c52c1ba0947626c46cec33be69714253c419a838dd9958ecf7f947e1fdc623890d879bf3fc8511dfb'
  )
md5sums=(
  '808c3ff51f89377c2e4f51ed48571ae4'
  '9ad6d138c2088aa9b913bf7b26cc2b08'
  )
validpgpkeys=('81BACEEBC3EA26E127166E4A819BB92A9A48160E')

package() {
    install -Dm644 usr/share/licenses/${pkgname}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm755 usr/bin/${pkgname} "${pkgdir}/usr/bin/${pkgname}"
}
