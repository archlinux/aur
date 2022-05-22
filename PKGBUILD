# Maintainer: Connor Etherington <connor@concise.cc>
# ---
pkgname=qcopy
pkgver=1.0
pkgrel=1
pkgdesc="Easily set variables and their respective values for easy access at any point"
arch=(any)
url="https://gitlab.com/a4to/${pkgname}"
license=('MIT')
depends=(fzf dialog xclip bat)
source=(
  "https://concise.cc/pkg/${pkgname}-${pkgver}-${pkgrel}-$arch.pkg.tar.zst"
  "https://concise.cc/pkg/${pkgname}-${pkgver}-${pkgrel}-$arch.pkg.tar.zst.sig"
  )
sha512sums=(
  '4c2c7b01312e3eddc7b081288a36a92174e27f9ad19d41ffcd0fc0c8cbfc879c211807cddf704fd23d77816b7f7cc06ec083e8ba58a0fa2cffdf18e8ad613e0c'
  '97a32a47293a3dbaa26a8be12b82d27e760fba2f2fd15027f128a1d9414ad6c38e9cacda66903b6c27de061f91e5dee1e86f531d5f9a1bc034c370d079daf611'
  )
md5sums=(
  'dbf7c4722c8b9eeb1de7887c129cf92b'
  '5e5efdadc0cf33cc73f55d8c1e1e368a'
  )
validpgpkeys=('81BACEEBC3EA26E127166E4A819BB92A9A48160E')

package() {
  cd "$srcdir/$pkgname"
    install -Dm644 usr/share/licenses/${pkgname}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm755 usr/bin/${pkgname} "${pkgdir}/bin/${pkgname}"
}
