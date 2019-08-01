# Maintainer: Kaizhao Zhang <zhangkaizhao@gmail.com>

pkgname=omg
pkgver=0.14.0
pkgrel=1
pkgdesc="A CLI to interact with microservices built with the OMG standard."
arch=('any')
url="https://microservice.guide/"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=(
  "https://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz"
)
sha256sums=(
  '2ffdc570b82af9ab710fb79485e9879f25021dcf7afd003868a8a2cea515cf23'
)
noextract=("${pkgname}-${pkgver}.tgz")

package() {
  npm install -g --user root --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"
  chmod -R go-w "${pkgdir}/usr"
}

# vim:set ts=2 sw=2 et:
