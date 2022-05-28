# Maintainer: Connor Etherington <connor@concise.cc>
# ---
pkgname=qcopy
pkgver=1.4
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
  '57c5a7eec67a10356749ce3d93dccedcf67888f8dde0011bd9aadf690b0349bf902ebbc0c3870581692977bb1022d83addaecf5378650dd72b97bb1db3f1a770'
  'c51c4ea4ebfce0c6fae655421f28c258537e5cf864e82a3bf3fa3b638308e3508030a71f127a3203019b7b1328677757fcf9193f3989bdfb110e0153da49044d'
  )
md5sums=(
  '7443ea0fe9e79fcebb199be264c7fd89'
  '65c39345ed840582311bcc451bba1903'
  )
validpgpkeys=('81BACEEBC3EA26E127166E4A819BB92A9A48160E')

package() {
    install -Dm755 usr/bin/${pkgname} "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 usr/share/licenses/${pkgname}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 usr/share/man/man1/${pkgname}.1.gz "${pkgdir}/usr/share/man/man1/${pkgname}.1.gz"
}
