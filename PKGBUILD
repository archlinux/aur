# Maintainer: Caleb Butler <cheertarts@github.com>
pkgname=vam
pkgver=1.5
pkgrel=1
pkgdesc="The simplest AUR helper"
arch=('any')
url="https://github.com/cheertarts/vam"
license=('MIT')
depends=('git' 'jshon' 'grep' 'bash' 'coreutils')
source=('git+https://github.com/cheertarts/vam.git')
md5sums=('SKIP')

package() {
  install -Dm755 "$srcdir"/$pkgname/vam "$pkgdir"/usr/bin/vam
  install -Dm644 "$srcdir"/$pkgname/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
