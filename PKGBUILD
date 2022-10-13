# Maintainer: Kyle McLean <kylem590@gmail.com>

pkgname=godot-server-bin
pkgver=3.5.1
pkgrel=1
pkgdesc="A headless version of the Godot game engine optimized for running game servers."
arch=('x86_64')
url="https://godotengine.org"
license=('MIT')
source=("https://downloads.tuxfamily.org/godotengine/$pkgver/Godot_v$pkgver-stable_linux_server.64.zip")

sha512sums=('2ee75f7fa932027773fd1a0906b909a5c484c1c7c245cd2e57da06b28524ec8f4c6716106e3e5d7cfe39ec3342fabe596bf08e8de41297be3e7592a7fad66de3')

package() {
  mkdir -p "$pkgdir/usr/bin"

  install -Dm755 "$srcdir/Godot_v$pkgver-stable_linux_server.64" "$pkgdir/usr/bin/godot-server"
}
