# Maintainer: tinywrkb <tinywrkb@gmail.com>

_gitname=complete-alias
pkgname=bash-${_gitname}
pkgver=1.18.0
pkgrel=1
pkgdesc='automagical bash shell alias completion'
arch=(any)
url='https://repo.cykerway.com/complete-alias'
license=('GPL3')
install=${pkgname}.install
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/cykerway/${_gitname}/archive/${pkgver}.tar.gz")
sha256sums=('c34b85c2729650415d97280afeeed6aa29a9e318a8a39061722493cacb927445')

package() {
depends=('bash-completion' 'findutils')

  cd ${_gitname}-${pkgver}
  install -Dm644 complete_alias "${pkgdir}"/usr/share/${pkgname}/complete_alias
  install -Dm644 README.md "${pkgdir}"/usr/share/doc/${pkgname}/README.md
}
