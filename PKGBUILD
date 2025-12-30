# SPDX-License-Identifier: MIT OR AGPL-3.0-or-later
# Maintainer: hyperpolymath <packages@hyperpolymath.dev>
# Contributor: Vext Contributors

pkgname=vext-bin
pkgver=1.0.0
pkgrel=1
pkgdesc='High-performance IRC notification daemon for version control systems (prebuilt binary)'
arch=('x86_64' 'aarch64')
url='https://github.com/hyperpolymath/vext'
license=('MIT' 'AGPL-3.0-or-later')
depends=('gcc-libs' 'openssl')
provides=('vext' 'vextd' 'vext-send')
conflicts=('vext' 'vext-git')
source_x86_64=("https://github.com/hyperpolymath/vext/releases/download/v$pkgver/vext-v$pkgver-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("https://github.com/hyperpolymath/vext/releases/download/v$pkgver/vext-v$pkgver-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('SKIP')
sha256sums_aarch64=('SKIP')

package() {
  install -Dm755 "vextd" "$pkgdir/usr/bin/vextd"
  install -Dm755 "vext-send" "$pkgdir/usr/bin/vext-send" 2>/dev/null || true
}
