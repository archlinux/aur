# Maintainer: Da4ndo <contact@da4ndo.com>

# This PKGBUILD is not a full PKGBUILD
# pkgver, source, and sha256sums are to be generated

pkgname=project-cleaner
pkgver=2
pkgrel=2
arch=(x86_64)
license=(MIT)
url="https://github.com/Da4ndo/project-cleaner"
source=("https://github.com/Da4ndo/project-cleaner/releases/download/v2/project-cleaner-v2-x86_64-linux.tar.gz")
sha256sums=('1c1a2d949743b8c2f2f984916cefe7022d4ff90d98f75ea764a2c0c7f86665a6')

package() {
  cd "project-cleaner-v${pkgver}-x86_64-linux"
  install -Dm755 "project-cleaner" "$pkgdir/usr/bin/project-cleaner"

  # Install clean.config.json file to /etc/project-cleaner/
  install -Dm644 clean.config.json "$pkgdir/etc/project-cleaner/clean.config.json"
}
