# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=godot3-as-bin
pkgver=3.6
pkgrel=1
pkgdesc="Advanced cross-platform 2D and 3D game engine (3.X Branch), utilize godot3-bin"
arch=("x86_64")
url='https://godotengine.org'
license=('MIT')
depends=(godot3-bin)
provides=(godot3)
conflicts=(godot3)
optdepends=(pipewire-alsa pipewire-pulse)

package() {
  mkdir -p "${pkgdir}/usr/bin"
  ln -s godot3-bin "${pkgdir}/usr/bin/godot3"
}
