# Maintainer: Pierre Penninckx <ibizapeanut@gmail.com>

pkgname='haskell-keycloak'
pkgver=0.0.0.1
pkgrel=1
pkgdesc='Command-line interface and library to configure Keycloak'
arch=('any')
url='https://github.com/ibizaman/haskell-keycloak'
license=('GPL3')
source=(https://github.com/ibizaman/haskell-keycloak/releases/download/${pkgver}/keycloak.zip)
sha512sums=('a4ae9b090742b21005dd794d813842c7ccd65e7d0f0d4e3326c1b536c3bbe559d16731129fb80bd970735e1bb10f5f41f2ef98b57acbde6810e4a744bb82700c')

package() {
  install -Dm0755 keycloak "$pkgdir"/usr/bin/hskeycloak
}
