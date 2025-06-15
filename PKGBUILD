# Maintainer: Vincent Bernardoff <vb@luminar.eu.org>
pkgname=elp
pkgver=20250529
_pkgver=2025-05-29_1
_otpver=27.1
pkgrel=1
epoch=
pkgdesc="Erlang Language Platform"
arch=('x86_64' 'aarch64')
url=""
license=('GPL')
groups=()
source=("https://github.com/WhatsApp/erlang-language-platform/releases/download/${_pkgver}/elp-linux-${arch}-unknown-linux-gnu-otp-${_otpver}.tar.gz")
sha256sums=('6e29ec5ecc582ab81275da0fdddcfe6587ba4173b5dd659e887022a02c0b6e19')

package() {
  install -D "$srcdir/elp" "$pkgdir/usr/bin/elp"
}

# vim:set ts=2 sw=2 et:
