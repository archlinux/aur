# Maintainer: Connor Etherington <connor@concise.cc>
# ---
pkgname=qcopy
pkgver=1.2
pkgrel=1
pkgdesc="Easily set variables and their respective values for easy access at any point"
arch=(any)
url="https://gitlab.com/a4to/${pkgname}"
license=('MIT')
depends=(fzf dialog xclip bat)
install="qcopy.install"
source=(
  "https://concise.cc/pkg/${pkgname}-${pkgver}-${pkgrel}-$arch.pkg.tar.zst"
  "https://concise.cc/pkg/${pkgname}-${pkgver}-${pkgrel}-$arch.pkg.tar.zst.sig"
  )
sha512sums=(
  'a810674d2f04621398ba208f2bf97d12a9c37fcf6efe5da939484e771ea04e9eb0569c7738de268e2172597fc9c3ffb6058e156b14170faf3d3bfc77ad2ddad0'
  '9468b86d7e54dd6def3ac9812a140e70a1a60716f81c2e0325dafb78b1655fab5b73cc84fcb0f9735e0b64a1980abb49fc28f5b42bbe6e80d6301e2c3474698d'
  )
md5sums=(
  '5f226d4fe4bbbfba6d145175cfe8a522'
  '7fb73a7d87a815ef5a9e2009192793a5'
  )
validpgpkeys=('81BACEEBC3EA26E127166E4A819BB92A9A48160E')

package() {
    install -Dm755 usr/bin/${pkgname} "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 usr/share/licenses/${pkgname}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 usr/share/man/man1/${pkgname}.1.gz "${pkgdir}/usr/share/man/man1/${pkgname}.1.gz"
}
