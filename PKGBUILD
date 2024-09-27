# Maintainer: Da4ndo <contact@da4ndo.com>

# This PKGBUILD is not a full PKGBUILD
# pkgver, source, and sha256sums are to be generated

pkgname=hyde-ext
pkgver=1.3.1
pkgrel=1
arch=(x86_64)
license=(MIT)
url="https://github.com/Da4ndo/Hyde-Ext"
source=("https://github.com/Da4ndo/Hyde-Ext/releases/download/v1.3.1/hyde-ext-v1.3.1-x86_64-linux.tar.gz")
sha256sums=('b94a2f933a062d28a9408cb081aee10e1fb259073f7985f985fb89ff4d6b405a')

package() {
  cd "hyde-ext-v${pkgver}-x86_64-linux"
  install -Dm755 "hyde-ext" "$pkgdir/usr/bin/hyde-ext"

  # Install assets.meta file to /etc/hyde-ext/
  install -Dm644 assets.meta "$pkgdir/etc/hyde-ext/assets.meta"
}