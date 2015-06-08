# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=averagehist
pkgname=vapoursynth-plugin-${_plug}
pkgver=r0
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug}"
arch=('any')
url="http://forum.doom9.org/showthread.php?t=168521"
license=('GPL')
depends=('vapoursynth')
source=('averagehist.py')
sha1sums=('7180cdb099965cd9cf300afad41e23fff4da82f6')
_sites_packages="$(python -c "from distutils.sysconfig import get_python_lib; print(get_python_lib())")"

package(){
  install -Dm644 averagehist.py "${pkgdir}${_sites_packages}/averagehist.py"
}
