# Maintainer: nic96 <jeromyreimer at gmail dot com>

pkgname=blender-ac3d
pkgver=20131105
pkgrel=3
pkgdesc="AC3D (.ac) File format import/export within blender"
arch=('i686' 'x86_64')
url="https://github.com/majic79/Blender-AC3D"
depends=('python' 'blender')
makedepends=('git')
blender_version="`blender --version | head -n 1 | sed 's/.*\([0-9].[0-9][0-9]\).*/\1/g'`"
license=('GPL')
install='blender-ac3d.install'
source=("git://github.com/majic79/Blender-AC3D.git")
md5sums=('SKIP')

package() {
    mkdir -p ${pkgdir}/usr/share/blender/$blender_version/scripts/addons
    cp -r ${srcdir}/Blender-AC3D/io_scene_ac3d/ ${pkgdir}/usr/share/blender/$blender_version/scripts/addons/
}

# vim:set ts=2 sw=2 et:
