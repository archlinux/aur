# Maintainer: Caleb Butler <cheertarts@github.com>
pkgname=yam
pkgver=1.0
pkgrel=1
pkgdesc="The simplest AUR helper"
arch=('any')
url="https://github.com/cheertarts/yam"
license=('MIT')
depends=('git' 'jshon' 'grep' 'bash' 'coreutils')
source=('git+https://github.com/cheertarts/yam.git')
md5sums=('SKIP')

package() {
  install -Dm755 "$srcdir"/$pkgname/yam "$pkgdir"/usr/bin/yam
  install -Dm644 "$srcdir"/$pkgname/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
