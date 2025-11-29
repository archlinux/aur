# Maintainer: Arjix  <me@arjix.dev>

COMMIT_HASH="6b3d9df404b95998530de82c7a59d7a20228a5f1"

pkgname=flatpak-extract
pkgver=1.0.0
pkgrel=1
pkgdesc="a CLI app for extracting .flatpak files"
arch=(x86_64)
url="https://github.com/faveoled/$pkgname"
license=(MIT)
depends=(
  python
  ostree
)

source=("https://raw.githubusercontent.com/faveoled/$pkgname/$COMMIT_HASH/local/$pkgname/$pkgname.py")
sha256sums=('7a37aa5b953ca192935e7bfad2f95b9b51458978ec4116e489f07288db6f283b')

package() {
  install -Dm755 $pkgname.py "$pkgdir"/usr/bin/$pkgname
}
