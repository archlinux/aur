# Maintainer: Federico <fshestenge@gmail.com>

pkgname=pjfetch1
pkgver=1.0
pkgrel=1
pkgdesc='El fetch más Peronista'
arch=('any')
url='https://github.com/f3d31206/pjfetch2'  # O tu web personal
license=('MIT')  # O lo que corresponda
depends=('bash')  # Dependencias necesarias
source=('https://github.com/f3d31206/pjfetch2/archive/refs/tags/v${pkgver}.tar.gz')
md5sums=('SKIP')

package() {
  install -Dm755 '$srcdir/murgafetch' '$pkgdir/usr/bin/murgafetch'
}
