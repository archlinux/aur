# Maintainer: tinywrkb <tinywrkb@gmail.com>

_gitname=complete-alias
pkgname=bash-${_gitname}
pkgver=1.9.0
pkgrel=2
pkgdesc='automagical bash shell alias completion'
arch=(any)
url='https://repo.cykerway.com/complete-alias'
license=('GPL3')
install=${pkgname}.install
source=("https://github.com/cykerway/${_gitname}/archive/${pkgver}.tar.gz")
sha256sums=('f636b9c9262fb05fd2cd71da4a570d7cff5b25ccf88e1f78a74c8c80484f1a29')

package() {
  depends=('bash-completion' 'findutils' 'sed')

  cd ${_gitname}-${pkgver}
  install -Dm644 complete_alias "${pkgdir}"/usr/share/${pkgname}/complete_alias
  install -Dm644 README.md "${pkgdir}"/usr/share/doc/${pkgname}/README.md
}
