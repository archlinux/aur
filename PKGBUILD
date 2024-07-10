# Maintainer: mia <mia@mia.jetzt>

pkgname='gleam-bin'
pkgver='1.3.1'
pkgrel='1'
pkgdesc='A friendly language for building type-safe, scalable systems!'
arch=('x86_64')
url='https://gleam.run'
license=('Apache-2.0')
provides=('gleam')
source=("https://github.com/gleam-lang/gleam/releases/download/v$pkgver/gleam-v$pkgver-x86_64-unknown-linux-musl.tar.gz")
sha256sums=('7ea732f927098d825e90d27c5361d497518d64eb74b4b3b875398a537a937dea')
depends=('erlang-nox')

package() {
    install -Dm 755 "$srcdir/gleam" "$pkgdir/usr/bin/gleam"
}
