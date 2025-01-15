# Maintainer: mia <mia@mia.jetzt>

pkgname='gleam-bin'
pkgver='1.7.0'
pkgrel='1'
pkgdesc='A friendly language for building type-safe, scalable systems!'
arch=('x86_64')
url='https://gleam.run'
license=('Apache-2.0')
provides=('gleam')
source=("https://github.com/gleam-lang/gleam/releases/download/v$pkgver/gleam-v$pkgver-x86_64-unknown-linux-musl.tar.gz")
sha256sums=('b5fc6e6b9b8e8ebeeda3b9be60503d93b409d437d9f4595b4d5c9e1449c14f49')
depends=('erlang-nox')

package() {
    install -Dm 755 "$srcdir/gleam" "$pkgdir/usr/bin/gleam"
}
