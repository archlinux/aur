# Maintainer: Sergey A. <murlakatamenka@disroot.org>
#
# shellcheck shell=bash
# shellcheck disable=SC2034,SC2164

pkgname=crabz-bin
pkgver=0.10.1
pkgrel=1
pkgdesc="Like pigz, but in Rust"
arch=('x86_64')
url='https://github.com/sstadick/crabz'
license=('MIT')
provides=('crabz')
conflicts=('crabz')
source=("crabz-${pkgver}::${url}/releases/download/v${pkgver}/crabz-linux-amd64")
sha256sums=('6d263b81540728691beebc3ce699f1f5047c31660bcd77009d35be5b2718a9f1')

package() {
  install -D -m755 "crabz-$pkgver" "$pkgdir/usr/bin/crabz"
}
