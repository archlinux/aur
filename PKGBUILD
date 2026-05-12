# Maintainer: d10n <david at bitinvert dot com>

pkgname=mullvad-tui-bin
pkgver=0.8.1
pkgrel=1
pkgdesc='Terminal user interface for mullvad-vpn'
arch=(x86_64)
url=https://github.com/d10n/mullvad-tui
license=(GPL-3.0-or-later)
provides=(mullvad-tui)
conflicts=(mullvad-tui)
depends=(mullvad-vpn)
options=(!lto !debug)
source=(
    "https://github.com/d10n/mullvad-tui/releases/download/v$pkgver/mullvad-tui-$pkgver-x86_64-unknown-linux-musl"
)
sha256sums=('2042263a00c194d452979772c80c59abe3c6d381f0bbe6aa19d673fedfcf114f')

package() {
  install -Dm0755 "$srcdir/mullvad-tui-$pkgver-x86_64-unknown-linux-musl" "$pkgdir/usr/bin/mullvad-tui"
}

