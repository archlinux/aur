# Maintainer: PerilousBooklet <raffaele.orabona@protonmail.com>
# Contributor: Shayne Hartford <shayneehartford@gmail.com>

pkgname=godot-voxel-bin
_pkgname=godot-voxel
pkgver=4.1.4rc+2d3b2abcf
pkgrel=1
pkgdesc="Binary files for the Godot game engine with Zylann's voxel tools module."
arch=("x86_64")
url="https://github.com/Zylann/godot_voxel"
license=("MIT")
provides=("godot-voxel")
conflicts=("godot-voxel")
source=("godot-voxel.desktop"
        "https://github.com/godotengine/godot/blob/master/icon.svg"
        "https://github.com/Zylann/godot_voxel/releases/download/v1.1.0/godot.linuxbsd.template_release.x86_64.zip"
        )
md5sums=('SKIP'
         'SKIP'
         'SKIP')

package() {
  install -Dm644 "$srcdir/godot-voxel.desktop" "$pkgdir/usr/share/applications/godot-voxel.desktop"
  install -Dm644 "$srcdir/icon.svg" "$pkgdir/usr/share/icons/hicolor/48x48/apps/godot-voxel.svg"
  install -Dm755 "$srcdir/godot.linuxbsd.template_release.x86_64" "$pkgdir/usr/bin/godot-voxel"
}
