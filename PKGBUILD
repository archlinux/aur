# Maintainer: VHSgunzo <vhsgunzo.github.io>
pkgname='notify-send-rs-bin'
pkgver='0.0.1'
pkgrel='1'
pkgdesc='Rust version of notify-send for display notifications on the linux desktop using notify-rust'
arch=("x86_64")
url="https://github.com/VHSgunzo/${pkgname%-bin}"
source=("${pkgname%-bin}.tar.xz::https://github.com/VHSgunzo/${pkgname%-bin}/releases/download/v${pkgver}/${pkgname%-bin}.tar.xz")
sha256sums=('SKIP')

package() { install -Dm755 ${pkgname%-bin} "$pkgdir/usr/bin/${pkgname%-bin}" ; }
