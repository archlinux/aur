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
source=("https://github.com/Da4ndo/CEngine/releases/download/1.2.0/hyprproxlock-linux-x64")
sha256sums=('0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5')

package() {
  install -Dm755 "cengine-linux-x64" "$pkgdir/usr/bin/cengine"
}