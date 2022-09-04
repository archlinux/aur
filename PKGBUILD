# Maintainer: Connor Etherington <connor@concise.cc>
# ---
pkgname=nav
pkgver=1.0.2
pkgrel=1
pkgdesc="A means of quick navigation through directories in the CLI"
arch=(any)
url="https://gitlab.com/a4to/${pkgname}"
license=('MIT')
depends=(dialog)
source=(
  "https://concise.cc/pkg/${pkgname}-${pkgver}-${pkgrel}-$arch.pkg.tar.zst"
  "https://concise.cc/pkg/${pkgname}-${pkgver}-${pkgrel}-$arch.pkg.tar.zst.sig"
  )
sha512sums=(
  'f75e2b267c1e8f6f13d9205ba90f891ee5921a0ae2dc3703c3247f9a4c7b66054450ed7179cee531b73a00dc3b127d84d9e6d47a6a8e0a578be4e1a78bbbd86c'
  '6e97a6797a831502d5730392f332dfcdd8df0501ee0a98d049299ae634a42a4e423e5dd2745984df03f22b6362b90270ed036f472202178cc45ccabe1e9fde1f'
  )
md5sums=(
  '74c30bbe12a76d7815291e6118811671'
  'cc0e34dd66c8ce08f41b98e342cc26ff'
  )
validpgpkeys=('81BACEEBC3EA26E127166E4A819BB92A9A48160E')

package() {
    install -Dm644 usr/share/licenses/${pkgname}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm755 usr/bin/${pkgname} "${pkgdir}/usr/bin/${pkgname}"
}
