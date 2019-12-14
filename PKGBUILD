# Maintainer: qaz <fkxxyz@163.com>
# Contributor: qaz <fkxxyz@163.com>

pkgname=spacman
pkgver=1.0.3
pkgrel=1
pkgdesc="A Package Management Tool with Whitelist Package List."
arch=('any')
url="https://github.com/fkxxyz/${pkgname}"
license=('GPL3')
depends=('python')
source=(${pkgname}::"https://github.com/fkxxyz/${pkgname}/raw/master/${pkgname}.py")
md5sums=('SKIP')

package() {
  install -Dm755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}

# vim:set ts=2 sw=2 et:
