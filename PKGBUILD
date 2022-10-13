# Maintainer: Kyle McLean <kylem590@gmail.com>

pkgname=godot-headless-bin
pkgver=3.5.1
pkgrel=1
pkgdesc="A headless version of the Godot game engine for running tests and exporting projects."
arch=('x86_64')
url="https://godotengine.org"
license=('MIT')
source=("https://downloads.tuxfamily.org/godotengine/$pkgver/Godot_v$pkgver-stable_linux_headless.64.zip")

sha512sums=('9f7a7101aa3985b1662a9b30f3e9b3a1add9b114e4212faac126329c3bb284620fb4e98cdbc5c652383d897e5e18ce7602abba8cf601650f994c7dd45b7b9781')

package() {
  mkdir -p "$pkgdir/usr/bin"

  install -Dm755 "$srcdir/Godot_v$pkgver-stable_linux_headless.64" "$pkgdir/usr/bin/godot-headless"
}
