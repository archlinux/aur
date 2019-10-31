# Maintainer: Thermi <noel [at] familie-kuntze dot de>

pkgname=swanctl-completion
pkgver=1.0
pkgrel=1
pkgdesc='strongSwan swanctl tool bash autocompletion'
url='https://github.com/Thermi/swanctl-completion'
license=('GPL3')
arch=('any')
depends=('python' 'python-urllib3' 'strongswan')

source=("https://github.com/Thermi/swanctl-completion/releases/download/1.0/swanctl-completion-1.0.tar.gz"{,.asc})

validpgpkeys=("352493BEB5F78E631372AF2DF54EE40B0739AD6C")

sha512sums=('14735249886911ab3dbb523c3c45c4297a711f1ffad151d0e046e72ae7a062e9139f341e89b67be99a876bd4b3389f2f2f396c28890bc045d25c5d18fd3e63da'
            'SKIP')

package() {
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}/swanctl.sh" "${pkgdir}/usr/share/bash-completion/completions/swanctl.sh"
}

# vim: ts=2 sw=2 et:
