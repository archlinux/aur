# Maintainer: mia <mia@mia.jetzt>

pkgname='gleam-bin'
pkgver='1.8.1'
pkgrel='1'
pkgdesc='A friendly language for building type-safe, scalable systems!'
arch=('x86_64')
url='https://gleam.run'
license=('Apache-2.0')
provides=('gleam')
source=("https://github.com/gleam-lang/gleam/releases/download/v$pkgver/gleam-v$pkgver-x86_64-unknown-linux-musl.tar.gz")
sha256sums=('1d608de1238a771f99086d6cacc52e8c65560a64e9c1ed7b0518f05ec7a847a8')
depends=('erlang-core')
optdepends=('rebar3')

package() {
    install -Dm 755 "$srcdir/gleam" "$pkgdir/usr/bin/gleam"
}
