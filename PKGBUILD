# Maintainer:  Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=havsfunc
pkgname=vapoursynth-plugin-${_plug}
pkgver=r17
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug}"
arch=('i686' 'x86_64')
url="http://forum.doom9.org/showthread.php?t=166582"
license=('GPL')
depends=('vapoursynth')
makedepends=('git')
source=("https://dl.dropbox.com/u/6596386/vapoursynth-plugins/${_plug}-${pkgver}.7z")
sha1sums=('490a7b067b2bbca84db624285cc24b6b3c91c713')
_sites_packages="$(python -c "from distutils.sysconfig import get_python_lib; print(get_python_lib())")"

package() {
  install -Dm644 "${_plug}.py" "${pkgdir}${_sites_packages}/${_plug}.py"
}

