# Maintainer: Corey Hinshaw <corey(at)electrickite(dot)org>
# Contributor: zer0def <zer0def@github>

pkgname=sbkeys
pkgver=1.0.1
pkgrel=1
pkgdesc="Simple script to generate Secure Boot keys"
arch=('any')
url="https://github.com/electrickite/sbkeys"
license=('GPL3')
depends=('efitools' 'coreutils' 'bash' 'openssl' 'util-linux')

source=('sbkeys')
sha256sums=('895dc5b515625ea515c3f74279dfe67cf40efea4f23ac5e4dbe78213da34d957')

package() {
  install -Dm755 sbkeys "${pkgdir}/usr/bin/sbkeys"
}
