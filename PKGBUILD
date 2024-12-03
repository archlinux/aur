# Maintainer: Da4ndo <contact@da4ndo.com>

# This PKGBUILD is not a full PKGBUILD
# pkgver, source, and sha256sums are to be generated

pkgname=project-cleaner
pkgver=2
pkgrel=1
arch=(x86_64)
license=(MIT)
url="https://github.com/Da4ndo/project-cleaner"
source=("https://github.com/Da4ndo/project-cleaner/releases/download/v2/project-cleaner-v2-x86_64-linux.tar.gz")
sha256sums=('b869062f3f74bff465514ddcc272ab5dc4f196812de124324f46b3416a9f9665')

package() {
  cd "project-cleaner-v${pkgver}-x86_64-linux"
  install -Dm755 "project-cleaner" "$pkgdir/usr/bin/project-cleaner"

  # Install clean.config.json file to /etc/project-cleaner/
  install -Dm644 clean.config.json "$pkgdir/etc/project-cleaner/clean.config.json"
}
