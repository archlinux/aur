# Maintainer: tinywrkb <tinywrkb@gmail.com>

_gitname=complete-alias
pkgname=bash-${_gitname}
pkgver=1.10.0
pkgrel=1
pkgdesc='automagical bash shell alias completion'
arch=(any)
url='https://repo.cykerway.com/complete-alias'
license=('GPL3')
install=${pkgname}.install
source=("https://github.com/cykerway/${_gitname}/archive/${pkgver}.tar.gz")
sha256sums=('467a8a0cff0e2c5096f2e42c7b991cff20f5252b7f69e4cfbb6984d3ce0ab06d')

package() {
  depends=('bash-completion' 'findutils' 'sed')

  cd ${_gitname}-${pkgver}
  install -Dm644 complete_alias "${pkgdir}"/usr/share/${pkgname}/complete_alias
  install -Dm644 README.md "${pkgdir}"/usr/share/doc/${pkgname}/README.md
}
