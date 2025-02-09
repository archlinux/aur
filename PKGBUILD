# Maintainer: mia <mia@mia.jetzt>

pkgname='gleam-bin'
pkgver='1.8.0'
pkgrel='1'
pkgdesc='A friendly language for building type-safe, scalable systems!'
arch=('x86_64')
url='https://gleam.run'
license=('Apache-2.0')
provides=('gleam')
source=("https://github.com/gleam-lang/gleam/releases/download/v$pkgver/gleam-v$pkgver-x86_64-unknown-linux-musl.tar.gz")
sha256sums=('f1337f74939ed33aa3d730936b120d83097d6426d0be288719b0b4e2a9dc9ff5')
depends=('erlang-nox')

package() {
    install -Dm 755 "$srcdir/gleam" "$pkgdir/usr/bin/gleam"
}
