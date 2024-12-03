# Maintainer: Da4ndo <contact@da4ndo.com>

pkgname=project-cleaner
pkgver=v2
pkgrel=3
arch=(x86_64)
license=(MIT)
url="https://github.com/Da4ndo/project-cleaner"
source=("https://github.com/Da4ndo/project-cleaner/releases/download/v2/project-cleaner-v2-x86_64-linux.tar.gz")
sha256sums=('c5a2b93eb5cd97e4a802c498b6589ef8418b58b2b3b0974e0b87c560af4e1b67')

package() {
  cd "${pkgname}-v${pkgver}-x86_64-linux"
  install -Dm755 "${pkgname}" "$pkgdir/usr/bin/${pkgname}"
  install -Dm644 clean.config.json "$pkgdir/etc/${pkgname}/clean.config.json"
}
