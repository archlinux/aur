# Maintainer: Kaizhao Zhang <zhangkaizhao@gmail.com>

pkgname=redoc-cli
pkgver=0.8.6
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
  'e64181cc57eca30237d5d38132e75b4383555a754a4bacdc79a54e98fcead423'
)
noextract=("${pkgname}-${pkgver}.tgz")

package() {
  npm install -g --user root --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"
  chmod -R go-w "${pkgdir}/usr"
}

# vim:set ts=2 sw=2 et:
