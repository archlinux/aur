# Maintainer: Chris van Dijk <quigybo@hotmail.com>

pkgname=luatool-git
_pkgname=luatool
pkgver=0.6.4
pkgrel=1
pkgdesc='Small python script for loading init.lua to ESP8266 nodemcu firmware'
arch=('any')
url='https://github.com/4refr0nt/luatool'
license=('LGPL3')
makedepends=('git')
depends=('python2-pyserial')
source=(luatool::git+https://github.com/4refr0nt/luatool)
md5sums=('SKIP')

package() {
  cd "$_pkgname"
  install -Dm755  luatool/luatool.py "${pkgdir}/usr/bin/luatool.py"
}

