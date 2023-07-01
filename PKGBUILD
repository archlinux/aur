# Maintainer: Connor Etherington <connor@concise.cc>
# ---
pkgname=editenv
pkgver=0.2.1
pkgrel=1
pkgdesc="A simple command line tool for conveniently storing and editing environment variables."
arch=(any)
url="https://gitlab.com/a4to/${pkgname}"
license=('MIT')
depends=(dialog xsel)
install="${pkgname}.install"
source=(
  "https://concise.cc/pkg/${pkgname}-${pkgver}-${pkgrel}-$arch.pkg.tar.xz"
)
sha512sums=(
  '115aa7b13610b57e9b5f4058493a153365d82518babe4893f352022ea39f11dbc85e52c8f35d29c59b20856cd386fde4345b289582a88d223b3dce4dd782bf5e'
)
md5sums=(
  '50ff97da253bdd7cb1aab4c31f8eecbd'
)
validpgpkeys=(
  '81BACEEBC3EA26E127166E4A819BB92A9A48160E'
)

package() {

  cd "$srcdir/${pkgname}-${pkgver}-${pkgrel}-${arch}" ||
  cd "$srcdir/${pkgname}"

  install -Dm644 usr/share/licenses/${pkgname}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm755 usr/bin/${pkgname} "${pkgdir}/usr/bin/${pkgname}"

}
