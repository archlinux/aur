# Maintainer: mia <mia@mia.jetzt>

pkgname='gleam-bin'
pkgver='1.0.0'
pkgrel='1'
pkgdesc='A friendly language for building type-safe, scalable systems!'
arch=('x86_64')
url='https://gleam.run'
license=('Apache-2.0')
provides=('gleam')
source=("https://github.com/gleam-lang/gleam/releases/download/v${pkgver}/gleam-v${pkgver}-x86_64-unknown-linux-musl.tar.gz")
sha256sums=('8f67909d90063cc4c0e025d8e020b0daa2f8ae8b4e4ca3214934c46378414a15')

package() {
    install -Dm 755 "${srcdir}/gleam" "${pkgdir}/usr/bin/gleam"
}
