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
  '8a6b488f61443604baeba82c975233ad9dc6c187e60d637895da1ee1326cf2d1a8e6b58da1026d621fa6e761d1241db4565f775417f2a0f5286f8aac35fdf97f'
  'ac6eb04f29e21f1790dae4969591feb5ce20e812ef7a4ff73269eaa7c8d3db117247c67435450ad5fd1ba9e7d637facb8e1ec4ec5c2cc7e24e9f23a553a8e930'
  )
md5sums=(
  '2bab4bbe977c5d72aa56950c01cdc462'
  'ed8d974b089434fca345e2b4917274dd'
  )
validpgpkeys=('81BACEEBC3EA26E127166E4A819BB92A9A48160E')

package() {
    install -Dm755 usr/bin/${pkgname} "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 usr/share/licenses/${pkgname}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 usr/share/man/man1/${pkgname}.1.gz "${pkgdir}/usr/share/man/man1/${pkgname}.1.gz"
}
