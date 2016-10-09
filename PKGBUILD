# Maintainer: Jordyn Carattini <onlinecloud1@gmail.com>
pkgname="shgreeter"
pkgver=1.4
pkgrel=1
pkgdesc="If placed in the proper directory, this script greets the user and offers some potentially interesting information about the system's current resources."
url="https://github.com/jcjordyn130/shgreeter"
license=('GPL3')
source=("https://github.com/jcjordyn130/shgreeter/archive/v1.4.tar.gz")
sha512sums=('08ba06cdd7b65ce80247ad6a938e88329dcbbbbac8ddbbd9d07eaf8dafb64d3a3bf673b20d12502700420784e69d6a0e3b1071a6240e930504e6bceeca00a81b')
arch=('any')
depends=('bash' 'coreutils')
makedepends=('git')
optdepends=('lsb-release: for outputing the name of the distro')

package() {
  mkdir -p ${pkgdir}/usr/bin
  cp -v ${srcdir}/shgreeter-${pkgver}/shgreeter ${pkgdir}/usr/bin/shgreeter
}

# vim:set et sw=2 sts=2 tw=80:
