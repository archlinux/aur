# Maintainer: VHSgunzo <vhsgunzo.github.io>
pkgname='notify-send-rs'
pkgver='0.0.1'
pkgrel='1'
pkgdesc='Rust version of notify-send for display notifications on the linux desktop using notify-rust'
arch=("x86_64")
url="https://github.com/VHSgunzo/${pkgname}"
provides=("${pkgname}")
conflicts=("${pkgname}")
source=("${pkgname}.tar.xz::https://github.com/VHSgunzo/${pkgname}/releases/download/v${pkgver}/${pkgname}.tar.xz")
sha256sums=('SKIP')

package() { install -Dm755 ${pkgname} "$pkgdir/usr/bin/${pkgname}" ; }
