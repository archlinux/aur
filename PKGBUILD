# Maintainer: tinywrkb <tinywrkb@gmail.com>

_gitname=complete-alias
pkgname=bash-${_gitname}
pkgver=1.7.0
pkgrel=1
pkgdesc='automagical bash shell alias completion'
arch=(any)
url='https://repo.cykerway.com/complete-alias'
license=('GPL3')
install=${pkgname}.install
makedepends=('git')
source=("git+https://github.com/cykerway/${_gitname}.git#tag=${pkgver}")
sha256sums=('SKIP')

package() {
  depends=('bash-completion')
  install -Dm644 ${_gitname}/complete_alias "${pkgdir}"/usr/share/${pkgname}/complete_alias
  install -Dm644 ${_gitname}/README.md "${pkgdir}"/usr/share/doc/${pkgname}/README.md
}
