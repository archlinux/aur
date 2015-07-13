# Maintainer: PitBall

pkgname=teamspeak3-xosd-overlay
pkgver=0.1
pkgrel=2
pkgdesc="Teamspeak3 overlay for Linux, which uses lua and xosd to output"
arch=('any')
url="https://bitbucket.org/l0ser140/teamspeak3-xosd-overlay"
license=('GPL')
depends=('lua' 'teamspeak3' 'xosd')
makedepends=('git')
source=("git+${url}.git")
#backup=('opt/teamspeak3/plugins/lua_plugin/osd/init.lua')
md5sums=('SKIP')
install=install

package() {
  cd "${pkgname}/osd"
  install -D -m666 init.lua $pkgdir/opt/teamspeak3/plugins/lua_plugin/osd/init.lua
}
