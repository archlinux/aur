# Maintainer: qaz <fkxxyz@163.com>
# Contributor: qaz <fkxxyz@163.com>

pkgname=spacman
pkgver=1.0.5
pkgrel=1
pkgdesc="A Package Management Tool with Whitelist Package List."
arch=('any')
url="https://github.com/fkxxyz/${pkgname}"
license=('GPL3')
depends=('python')
source=("https://github.com/fkxxyz/spacman/archive/${pkgver}.tar.gz")
sha256sums=('fd07ac11e5c0f40fc2cf4c416d605df033849d174509463bbc96cad89b7e96d6')

package() {
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}/spacman.py" \
    "${pkgdir}/usr/bin/${pkgname}"
}

# vim:set ts=2 sw=2 et:
