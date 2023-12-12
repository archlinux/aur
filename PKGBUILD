# Maintainer: mia <mia@mia.jetzt>

pkgname='gleam-bin'
pkgver='0.32.4'
pkgrel='1'
pkgdesc='A friendly language for building type-safe, scalable systems!'
arch=('x86_64')
url='https://gleam.run'
license=('Apache-2.0')
provides=('gleam')
source=("https://github.com/gleam-lang/gleam/releases/download/v${pkgver}/gleam-v${pkgver}-x86_64-unknown-linux-musl.tar.gz")
noextract=("${_pkgfile}")
sha256sums=('78de253d9675aa36b60660149bbabb9d13f986a1f39c061dc3c533c3cb77c1ee')

package() {
    install -Dm 755 "${srcdir}/gleam" "${pkgdir}/usr/bin/gleam"
}
