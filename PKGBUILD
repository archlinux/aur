# Maintainer: d10n <david at bitinvert dot com>

pkgname=asciinema-agg-plus-bin
pkgver=1.9.0
pkgrel=1
pkgdesc='asciinema gif generator fork with support for hinting and antialiasing'
arch=(x86_64)
url=https://github.com/d10n/agg-plus
license=(GPL-3.0-or-later)
provides=(asciinema-agg-plus)
conflicts=(asciinema-agg-plus)
options=(!lto !debug)
source=(
    "agg-plus-v$pkgver::https://github.com/d10n/agg-plus/releases/download/plus-v$pkgver/agg-plus-x86_64-unknown-linux-musl"
)
sha256sums=('4bd4d26dd45079e02741ababf5a0826f882b7a620e448f2916b2327dd2c5e40b')

package() {
  install -Dm0755 "$srcdir/agg-plus-v$pkgver" "$pkgdir/usr/bin/agg-plus"
}

