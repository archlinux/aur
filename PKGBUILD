# Maintainer: qaz <fkxxyz@163.com>
# Contributor: qaz <fkxxyz@163.com>

pkgname=spacman
pkgver=1.0.4
pkgrel=2
_git_log_id=2c86491bf7ff153edaddf3eea02d00bd44f3967e
pkgdesc="A Package Management Tool with Whitelist Package List."
arch=('any')
url="https://github.com/fkxxyz/${pkgname}"
license=('GPL3')
depends=('python')
source=(${pkgname}::"https://github.com/fkxxyz/${pkgname}/raw/${_git_log_id}/${pkgname}.py")
sha256sums=('eafe7fcf023718d103a122d919714e1a796fd01ee0dff5fce2799c77d7a87f09')

package() {
  install -Dm755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}

# vim:set ts=2 sw=2 et:
