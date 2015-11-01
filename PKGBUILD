# Maintainer: tasty_minerals <tastyminerals@gmail.com>
pkgname=lls
pkgver=1.5
pkgrel=1
pkgdesc="lls is a colorful "ls" alternative with additional file info.
lls provides pleasant colorful highlighting, file information and some easy-to-read permission tags.
In addition lls can draw folder trees with a total files/dirs count."
arch=(any)
url="https://github.com/tastyminerals/lls"
license=('MIT')
depends=('file')
source=('https://raw.githubusercontent.com/tastyminerals/lls/master/lls')
md5sums=('6fa410f1647700a2ba6ab0ebac52465f')

package() {
  install -D -m 755 lls ${pkgdir}/usr/bin/lls
}
