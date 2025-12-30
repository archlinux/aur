# Maintainer: Nia Schlegel <nia@3nt3.de>

pkgname=matrix-commander-rs-bin
pkgver=0.10.2
pkgrel=1
arch=('x86_64' 'aarch64')
pkgdesc="A terminal client for Matrix written in Rust"
source_x86_64=("https://github.com/8go/matrix-commander-rs/releases/download/v$pkgver/matrix-commander-rs.$CARCH-unknown-linux-gnu")
source_aarch64=("https://github.com/8go/matrix-commander-rs/releases/download/v$pkgver/matrix-commander-rs.$CARCH-unknown-linux-gnu")
sha256sums_x86_64=('bf40743eff62557bd6d6f607c7f672512a306dbdd7c39e0e34f413010520ba0f')
sha256sums_aarch64=('9a29f77fb30f59d59513e3fe611337fc2b6165dce011d1d328f92623608604e3')

license=('GPL-3.0-or-later')

package() {
  install -Dm755 "matrix-commander-rs.$CARCH-unknown-linux-gnu" "$pkgdir/usr/bin/matrix-commander-rs"
}
