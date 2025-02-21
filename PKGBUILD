# Maintainer: Vincent Bernardoff <vb@luminar.eu.org>
pkgname=elp
pkgver=20250213
_pkgver=2025-02-13
_otpver=27.1
pkgrel=1
epoch=
pkgdesc="Erlang Language Platform"
arch=('x86_64' 'aarch64')
url=""
license=('GPL')
groups=()
source=("https://github.com/WhatsApp/erlang-language-platform/releases/download/${_pkgver}/elp-linux-${arch}-unknown-linux-gnu-otp-${_otpver}.tar.gz")
sha256sums=('69d29903de4922c4692365ed196074ad18b83cd913fcb3f4babae2cff97f9f58')

package() {
  install -D "$srcdir/elp" "$pkgdir/usr/bin/elp"
}

# vim:set ts=2 sw=2 et:
