# Maintainer: Vincent Bernardoff <vb@luminar.eu.org>
pkgname=elp
pkgver=20241209
_pkgver=2024-12-09
_otpver=27.1
pkgrel=1
epoch=
pkgdesc="Erlang Language Platform"
arch=('x86_64' 'aarch64')
url=""
license=('GPL')
groups=()
source=("https://github.com/WhatsApp/erlang-language-platform/releases/download/${_pkgver}/elp-linux-${arch}-unknown-linux-gnu-otp-${_otpver}.tar.gz")
sha256sums=('514e083819f427e9a91078388ca8b5e3cddc556695cdd1c156b7ce4b3e3e3d7a')

package() {
  install -D "$srcdir/elp" "$pkgdir/usr/bin/elp"
}

# vim:set ts=2 sw=2 et:
