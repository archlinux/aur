# Maintainer: Jonas Schürmann <jonasschuermann@aol.de>
# Contributor: condy <condy0919[at]gmail[dot]com>
pkgname=psysh
pkgver=0.8.5
pkgrel=1
pkgdesc="PsySH is a runtime developer console, interactive debugger and REPL for PHP."
url="http://psysh.org"
arch=('x86_64' 'i686')
license=('MIT')
depends=('php')
provides=('psysh')
optdepends=('mariadb: mysql command support')
source=("https://github.com/bobthecow/psysh/releases/download/v${pkgver}/psysh-v${pkgver}.tar.gz"
        'https://raw.githubusercontent.com/bobthecow/psysh/master/LICENSE')
sha256sums=('f7c6e3d710a669159556ea34565db9ce6c88e28fe81d45258b6e04dfa4ff52c5'
            'ffe06af119d0b31e8d5bcfd219648d071023380fb3006b6b07017902ef632ad1')

package() {
  cd "${srcdir}"
  install -Dm755 psysh "${pkgdir}/usr/bin/psysh"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
