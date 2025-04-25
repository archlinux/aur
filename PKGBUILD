# Maintainer: Vincent Bernardoff <vb@luminar.eu.org>
pkgname=elp
pkgver=20250402
_pkgver=2025-04-02
_otpver=27.1
pkgrel=1
epoch=
pkgdesc="Erlang Language Platform"
arch=('x86_64' 'aarch64')
url=""
license=('GPL')
groups=()
source=("https://github.com/WhatsApp/erlang-language-platform/releases/download/${_pkgver}/elp-linux-${arch}-unknown-linux-gnu-otp-${_otpver}.tar.gz")
sha256sums=('d140236a949448e1d5b3516aef1a5a0bf3073702ef91ae1fa6611618419d4c73')

package() {
  install -D "$srcdir/elp" "$pkgdir/usr/bin/elp"
}

# vim:set ts=2 sw=2 et:
