# Maintainer: Jonas Schürmann <jonasschuermann@aol.de>
# Contributor: condy <condy0919[at]gmail[dot]com>
pkgname=psysh
pkgver=0.8.15
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
sha256sums=('cf165aa5c6ba8445e5a27fd9d64c04d3be92ea87374ff829f43a13cd8c6ecf48'
            'ffe06af119d0b31e8d5bcfd219648d071023380fb3006b6b07017902ef632ad1')

package() {
  cd "${srcdir}"
  install -Dm755 psysh "${pkgdir}/usr/bin/psysh"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
