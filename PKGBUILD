# Maintainer: mia <mia@mia.jetzt>

pkgname='gleam-bin'
pkgver='1.5.0'
pkgrel='1'
pkgdesc='A friendly language for building type-safe, scalable systems!'
arch=('x86_64')
url='https://gleam.run'
license=('Apache-2.0')
provides=('gleam')
source=("https://github.com/gleam-lang/gleam/releases/download/v$pkgver/gleam-v$pkgver-x86_64-unknown-linux-musl.tar.gz")
sha256sums=('abc87ce1f4b6508e3c780512ac30ec7f3edb2bccae9f0e93cc1ea7387b895eea')
depends=('erlang-nox')

package() {
    install -Dm 755 "$srcdir/gleam" "$pkgdir/usr/bin/gleam"
}
