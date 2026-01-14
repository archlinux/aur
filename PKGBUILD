# Maintainer: YaBoiMax <51027149+YaBoiMax@users.noreply.github.com>

pkgname=glaunch-git
pkgver=1.1
pkgrel=1
arch=('any')
pkgdesc="A script you can set as a launch command in steam to apply a config."
url="https://github.com/YaBoiMax/glaunch"
license=('GPL-1.0-or-later')
depends=(python python-yaml)
provides=(glaunch)
conflicts=(glaunch)
makedepends=(git)
optdepends=('gamemode: gamemoderun support')
source=("git+${url}.git")
sha256sums=('SKIP')

package()
{
  cd ${srcdir}/glaunch
  install -Dm755 main.py "${pkgdir}/usr/bin/glaunch"
}

