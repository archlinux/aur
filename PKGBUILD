# Maintainer: mia <mia@mia.jetzt>

pkgname='gleam-bin'
pkgver='1.6.1'
pkgrel='1'
pkgdesc='A friendly language for building type-safe, scalable systems!'
arch=('x86_64')
url='https://gleam.run'
license=('Apache-2.0')
provides=('gleam')
source=("https://github.com/gleam-lang/gleam/releases/download/v$pkgver/gleam-v$pkgver-x86_64-unknown-linux-musl.tar.gz")
sha256sums=('4a33864ce31535b601f73ac12c24b1dd659c0a267895a51815aec1af4f85dacc')
depends=('erlang-nox')

package() {
    install -Dm 755 "$srcdir/gleam" "$pkgdir/usr/bin/gleam"
}
