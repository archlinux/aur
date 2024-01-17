# Maintainer: mia <mia@mia.jetzt>

pkgname='gleam-bin'
pkgver='0.34.0'
pkgrel='1'
pkgdesc='A friendly language for building type-safe, scalable systems!'
arch=('x86_64')
url='https://gleam.run'
license=('Apache-2.0')
provides=('gleam')
source=("https://github.com/gleam-lang/gleam/releases/download/v${pkgver}/gleam-v${pkgver}-x86_64-unknown-linux-musl.tar.gz")
sha256sums=('1e6a7e28edad4b38122f839d57152065ba1da1134d59e4e0bae485a6ce13e1ea')

package() {
    install -Dm 755 "${srcdir}/gleam" "${pkgdir}/usr/bin/gleam"
}
