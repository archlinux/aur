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
  '8e4615480c601791d3aa3fb67aafd032c12d44a9e724cb83d50fb1fb264da3eedf37e7d76ced6ca5e837219130683c9efd7046f7057d9a71c38ba20c49673ea3'
  '63038cdf0e82fc30e49980def54043482a7d93de8fca34bc5e6f9245280b4173226659262b40e87d2da7fa0aaf16287dbc51632af8bf5c233f95e511bf01fd06'
  )
md5sums=(
  'dfebf9efb8d004926b8b3687430c12cb'
  'a3b3bc1f7e1db5551094670b14c39c67'
  )
validpgpkeys=('81BACEEBC3EA26E127166E4A819BB92A9A48160E')

package() {
    install -Dm644 usr/share/licenses/${pkgname}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm755 usr/bin/${pkgname} "${pkgdir}/usr/bin/${pkgname}"
}
