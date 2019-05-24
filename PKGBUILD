# Maintainer: Cameron Reikes <cameronreikes@gmail.com>

pkgname=godot-headless-bin
pkgver=3.1.1
pkgrel=1
pkgdesc="Godot is an advanced, feature packed, multi-platform 2D and 3D game engine"
arch=("x86_64")
url="http://www.godotengine.org"
license=("MIT")
source=("$pkgname-$pkgver::https://downloads.tuxfamily.org/godotengine/$pkgver/Godot_v$pkgver-stable_linux_headless.64.zip")
md5sums=("36fd2c3c401d0f9f7a20bfd7b0d03997")

package() {
  mkdir -p "$pkgdir/opt/$pkgname"
  mkdir -p "$pkgdir/usr/bin"

  cp "$srcdir/Godot_v"$pkgver"-stable_linux_headless.64" "$pkgdir/opt/$pkgname/godot-headless"

  chmod +x "$pkgdir/opt/$pkgname/godot-headless"

  ln -s "/opt/$pkgname/godot-headless" "$pkgdir/usr/bin/godot-headless"
}
