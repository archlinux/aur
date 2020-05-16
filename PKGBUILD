# Maintainer: Corey Hinshaw <corey(at)electrickite(dot)org>

pkgname=sbkeys
pkgver=1.0.0
pkgrel=1
pkgdesc="Simple script to generate Secure Boot keys"
arch=('any')
url="https://github.com/electrickite/sbkeys"
license=('GPL3')
depends=('efitools' 'coreutils' 'bash' 'python2' 'openssl')

source=('sbkeys')
sha256sums=('a6d7a5fbdd62a07423ef9641e30bb177746720801462f84636c27096926c2d42')

package() {
  install -Dm755 sbkeys "${pkgdir}/usr/bin/sbkeys"
}
