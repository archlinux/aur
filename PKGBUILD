# Maintainer: Jordyn Carattini <onlinecloud1@gmail.com>
pkgname="shgreeter"
pkgver=1.6
pkgrel=1
pkgdesc="If placed in the proper directory, this script greets the user and offers some potentially interesting information about the system's current resources."
url="https://github.com/jcjordyn130/shgreeter"
license=('GPL3')
source=("https://github.com/jcjordyn130/shgreeter/archive/v1.6.tar.gz")
sha512sums=('f7052bc54a64e5949b953d4142bab0b6ce4512730920f7ac42f2266c5448b0deeca32e5ebda7a39f85bcc126fcbe6eeb2d12413b52eee725787a1317cbb6a50f')
arch=('any')
depends=('bash' 'coreutils')
makedepends=('git')
optdepends=('lsb-release: for outputing the name of the distro')

package() {
  mkdir -p ${pkgdir}/usr/bin
  cp -v ${srcdir}/shgreeter-${pkgver}/shgreeter ${pkgdir}/usr/bin/shgreeter
}

# vim:set et sw=2 sts=2 tw=80:
