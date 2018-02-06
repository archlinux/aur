# Maintainer: Aquarius <aaquarius24@yandex.ru>

pkgname=blender-plugin-blam
pkgver=1
pkgrel=1
_blender=$(blender --version | grep -Po 'Blender \K[0-9]\...')
pkgdesc="This is BLAM, a camera calibration toolkit for Blender in the form of an add-on, written in python, that facilitates modeling based on photographs."
arch=('any')
url="http://stuffmatic.github.io/"
license=('GPL')
depends=('blender')
makedepends=('coreutils')
conflicts=()
source=(https://github.com/stuffmatic/blam/archive/v0.6.zip)
md5sums=(SKIP)

package() {
  cd "$srcdir/blam-0.6/src/"
  mkdir -p "$pkgdir/usr/share/blender/$_blender/scripts/addons/"
  cp * "$pkgdir/usr/share/blender/$_blender/scripts/addons/"
}