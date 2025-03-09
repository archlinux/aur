# Maintainer: Da4ndo <contact@da4ndo.com>

# This PKGBUILD is not a full PKGBUILD
# pkgver, source, and sha256sums are to be generated

pkgname=cengine
pkgver=1.2.0
pkgrel=2
pkgdesc="Powerful Rust-based tool for converting Python scripts into standalone executables."
arch=(x86_64)
license=(MIT)
url="https://github.com/Da4ndo/CEngine"
source=("https://github.com/Da4ndo/CEngine/releases/download/1.2.0/cengine-linux-x64")
sha256sums=('96267afbf10fe60ad7cfd029e308dae159d5b5b7c6a051776f80c98dc3d35a66')

package() {
  install -Dm755 "cengine-linux-x64" "$pkgdir/usr/bin/cengine"
}