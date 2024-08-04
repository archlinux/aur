# Maintainer: mia <mia@mia.jetzt>

pkgname='gleam-bin'
pkgver='1.4.1'
pkgrel='1'
pkgdesc='A friendly language for building type-safe, scalable systems!'
arch=('x86_64')
url='https://gleam.run'
license=('Apache-2.0')
provides=('gleam')
source=("https://github.com/gleam-lang/gleam/releases/download/v$pkgver/gleam-v$pkgver-x86_64-unknown-linux-musl.tar.gz")
sha256sums=('5676b05892c35fc00b50580c16a25f91e844ec79418d31be98f62598d705053d')
depends=('erlang-nox')

package() {
    install -Dm 755 "$srcdir/gleam" "$pkgdir/usr/bin/gleam"
}
