# Maintainer: wjsoj <wjs@wjsphy.top>

pkgname=dnstest-bin
pkgver=0.1.4
pkgrel=1
pkgdesc="A modern DNS speed testing and pollution detection CLI tool (pre-built binary)"
arch=('x86_64')
url="https://github.com/wjsoj/dnstest"
license=('MIT')
provides=('dnstest')
conflicts=('dnstest')
options=('!debug')
source_x86_64=("dnstest-$pkgver.tar.gz::https://github.com/wjsoj/dnstest/releases/download/v$pkgver/dnstest-x86_64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('5a034fc8216481ca5bd949b787fe979a7afce893577586e42dd63161773cfa4d')

package() {
  install -Dm755 "$srcdir/dnstest" "$pkgdir/usr/bin/dnstest"
}
