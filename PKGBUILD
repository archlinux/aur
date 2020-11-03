# Maintainer: Kaizhao Zhang <zhangkaizhao@gmail.com>

pkgname=redoc-cli
pkgver=0.9.13
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
  '132e5abeae1da812f044abe4da2ae8389f33cd346ebb9ae28e5e3b78b615fc82'
)
noextract=("${pkgname}-${pkgver}.tgz")

package() {
  npm install -g --user root --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"
  chmod -R go-w "${pkgdir}/usr"
}

# vim:set ts=2 sw=2 et:
