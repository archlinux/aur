# Maintainer: tinywrkb <tinywrkb@gmail.com>

_gitname=complete-alias
pkgname=bash-${_gitname}
pkgver=1.9.0
pkgrel=1
pkgdesc='automagical bash shell alias completion'
arch=(any)
url='https://repo.cykerway.com/complete-alias'
license=('GPL3')
install=${pkgname}.install
source=("https://github.com/cykerway/${_gitname}/archive/${pkgver}.tar.gz")
sha256sums=('5e6565c1e91b786b956b3bb98d1983fe7b840c08903c5f5639685467b01e9488')

package() {
  depends=('bash-completion' 'findutils' 'sed')

  cd ${_gitname}-${pkgver}
  install -Dm644 complete_alias "${pkgdir}"/usr/share/${pkgname}/complete_alias
  install -Dm644 README.md "${pkgdir}"/usr/share/doc/${pkgname}/README.md
}
