# Maintainer: Da4ndo <contact@da4ndo.com>

# This PKGBUILD is not a full PKGBUILD
# pkgver, source, and sha256sums are to be generated

pkgname=hyde-ext
pkgver=1.3.2
pkgrel=1
arch=(x86_64)
license=(MIT)
url="https://github.com/Da4ndo/Hyde-Ext"
source=("https://github.com/Da4ndo/Hyde-Ext/releases/download/v1.3.2/hyde-ext-v1.3.2-x86_64-linux.tar.gz")
sha256sums=('c8df707a64dbdf301866c36c7af0e47e7fa203732f93a311ad081f26a4fa2488')

package() {
  cd "hyde-ext-v${pkgver}-x86_64-linux"
  install -Dm755 "hyde-ext" "$pkgdir/usr/bin/hyde-ext"

  # Install assets.meta file to /etc/hyde-ext/
  install -Dm644 assets.meta "$pkgdir/etc/hyde-ext/assets.meta"
}