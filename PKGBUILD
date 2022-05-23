# Maintainer: Connor Etherington <connor@concise.cc>
# ---
pkgname=qcopy
pkgver=1.1
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
  'e7bdc3bd055243b7727c1cf2701e568b6d94abf3544b9f68e9b9f3c1c34fc38c0edef2255bf463d48a3bd3ef036c0f5978a89f6f82cd51109506c1eea555694b'
  'e6fe964ffa8007827eaece70719108138f37d026a56a76fc1a442663f0ab4690707ae969440e49d7def306e5ce7034240c7f0f77c72bc56f559856d565d42bda'
  )
md5sums=(
  '7bca69724002178341c2e419e6b3065b'
  '562e6730007751d659a761960be1b79d'
  )
validpgpkeys=('81BACEEBC3EA26E127166E4A819BB92A9A48160E')

package() {
    install -Dm644 usr/share/licenses/${pkgname}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm755 usr/bin/${pkgname} "${pkgdir}/usr/bin/${pkgname}"
}
