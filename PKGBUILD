# Maintainer: Jordyn Carattini <onlinecloud1@gmail.com>
pkgname="shgreeter"
pkgver=1.0
pkgrel=1
pkgdesc="If placed in the proper directory, this script greets the user and offers some potentially interesting information about the system's current resources."
url="https://github.com/jcjordyn130/shgreeter"
license=('GPL3')
source=("https://github.com/jcjordyn130/shgreeter/archive/v1.0.tar.gz")
sha512sums=('91c4ce64e84a9eddc1ed5c5558abc5fd84e89e1eed246b9815ae146e3bc53aa9b0b03e8c40beaf0bb6f809f7cc7d51be5bf87cc630fcee235e3e3acaae9afa16')
arch=('any')
depends=('bash' 'coreutils')
makedepends=('git')
optdepends=('lsb-release: for outputing the name of the distro')

package() {
  mkdir -p ${pkgdir}/usr/bin
  cp -v ${srcdir}/shgreeter-${pkgver}/shgreeter ${pkgdir}/usr/bin/shgreeter
}

# vim:set et sw=2 sts=2 tw=80:
