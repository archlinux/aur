# Maintainer: Da4ndo <contact@da4ndo.com>

# This PKGBUILD is not a full PKGBUILD
# pkgver, source, and sha256sums are to be generated

pkgname=hyde-ext
pkgver=v1.3.0
pkgrel=1
arch=(x86_64)
license=(MIT)
url="https://github.com/Da4ndo/Hyde-Ext"
source=("https://github.com/Da4ndo/Hyde-Ext/releases/download/vv1.3.0/hyde-ext-vv1.3.0-x86_64-linux.tar.gz")
sha256sums=('0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5')

package() {
  cd "hyde-ext-v${pkgver}-x86_64-linux"
  install -Dm755 "hyde-ext" "$pkgdir/usr/bin/hyde-ext"

  # Install assets.meta file to /etc/hyde-ext/
  install -Dm644 assets.meta "$pkgdir/etc/hyde-ext/assets.meta"
}