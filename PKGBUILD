# Maintainer: PerilousBooklet <raffaele.orabona@protonmail.com>
# Contributor: Shayne Hartford <shayneehartford@gmail.com>

pkgname=godot-voxel-bin
_pkgname=godot-voxel
pkgver=4.2.2rc+15073afe3
pkgrel=1
pkgdesc="Binary files for the Godot game engine with Zylann's voxel tools module."
arch=("x86_64")
url="https://github.com/Zylann/godot_voxel"
license=("MIT")
provides=("godot-voxel")
conflicts=("godot-voxel")
source=("godot-voxel.desktop"
        "https://github.com/godotengine/godot/blob/master/icon.svg"
        "https://github.com/Zylann/godot_voxel/releases/download/v1.2.0/godot.linuxbsd.template_release.x86_64.zip"
        )
md5sums=('ac244a0be7056833787095663ba181e6'
         'a1150c81468cb080ee51437c4ddbf64f'
         'b1450e49104e58523ddd727e1f2c0f88')

package() {
  install -Dm644 "$srcdir/godot-voxel.desktop" "$pkgdir/usr/share/applications/godot-voxel.desktop"
  install -Dm644 "$srcdir/icon.svg" "$pkgdir/usr/share/icons/hicolor/48x48/apps/godot-voxel.svg"
  install -Dm755 "$srcdir/godot.linuxbsd.template_release.x86_64" "$pkgdir/usr/bin/godot-voxel"
}
