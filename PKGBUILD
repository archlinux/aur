# Maintainer: Vincent Bernardoff <vb@luminar.eu.org>
pkgname=elp
pkgver=20260610
_pkgver=2026-06-10
_otpver=28
pkgrel=1
epoch=
pkgdesc="Erlang Language Platform"
arch=('x86_64' 'aarch64')
url=""
license=('GPL')
groups=()
source=("https://github.com/WhatsApp/erlang-language-platform/releases/download/${_pkgver}/elp-linux-${arch}-unknown-linux-gnu-otp-${_otpver}.tar.gz")
sha256sums=('104450964d8f43d85294d106fd6a5bf6094b88aef7a94685aeb719735d839fb7')

package() {
  install -D "$srcdir/elp" "$pkgdir/usr/bin/elp"
}

# vim:set ts=2 sw=2 et:
