# Maintainer: condy <condy0919[at]gmail[dot]com>
pkgname=psysh
pkgver=0.7.2
pkgrel=1
pkgdesc="PsySH is a runtime developer console, interactive debugger and REPL for PHP."
url="http://psysh.org"
arch=('x86_64' 'i686')
license=('MIT')
depends=('php')
provides=('psysh')
optdepends=('mariadb: mysql command support')
source=('http://psysh.org/psysh'
        'https://raw.githubusercontent.com/bobthecow/psysh/master/LICENSE')
md5sums=('1876f9badc9ebec0dd33393c687a6bdf'
         'SKIP')

package() {
  cd "${srcdir}"
  install -Dm755 psysh "$pkgdir/usr/bin/psysh"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
