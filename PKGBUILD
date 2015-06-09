# Maintainer:  Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=havsfunc
pkgname=vapoursynth-plugin-${_plug}
pkgver=r18
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug}"
arch=('i686' 'x86_64')
url="http://forum.doom9.org/showthread.php?t=166582"
license=('GPL')
depends=('vapoursynth')
makedepends=('git')
source=("https://dl.dropbox.com/u/6596386/vapoursynth-plugins/${_plug}-${pkgver}.7z")
sha1sums=('69466b7f0cfdf97be49e27a620be875702bb854b')
_sites_packages="$(python -c "from distutils.sysconfig import get_python_lib; print(get_python_lib())")"

package() {
  install -Dm644 "${_plug}.py" "${pkgdir}${_sites_packages}/${_plug}.py"
}
