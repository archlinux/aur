# Maintainer: Kaizhao Zhang <zhangkaizhao@gmail.com>

pkgname=redoc-cli
pkgver=0.9.12
pkgrel=1
pkgdesc="ReDoc's Command Line Interface"
arch=('any')
url="https://github.com/Redocly/redoc"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=(
  "https://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz"
)
sha256sums=(
  '3ab887936eddc45312af19e08022f96b56db8132de6bf39676ff30055a0b929c'
)
noextract=("${pkgname}-${pkgver}.tgz")

package() {
  npm install -g --user root --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"
  chmod -R go-w "${pkgdir}/usr"
}

# vim:set ts=2 sw=2 et:
