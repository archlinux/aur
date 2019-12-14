# Maintainer: qaz <fkxxyz@163.com>
# Contributor: qaz <fkxxyz@163.com>

pkgname=spacman
pkgver=1.0.3
pkgrel=2
_git_log_id=e6fd231c8fc71c3b444924df75613babbadea887
pkgdesc="A Package Management Tool with Whitelist Package List."
arch=('any')
url="https://github.com/fkxxyz/${pkgname}"
license=('GPL3')
depends=('python')
source=(${pkgname}::"https://github.com/fkxxyz/${pkgname}/raw/${_git_log_id}/${pkgname}.py")
sha256sums=('e721793056529a23cf3c7eb0ec6ad9b35e373279052016c9746494fb23d0aa2a')

package() {
  install -Dm755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}

# vim:set ts=2 sw=2 et:
