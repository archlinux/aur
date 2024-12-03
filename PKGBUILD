# Maintainer: Da4ndo <contact@da4ndo.com>

pkgname=project-cleaner
pkgver=2
pkgrel=4
arch=(x86_64)
license=(MIT)
url="https://github.com/Da4ndo/project-cleaner"
source=("https://github.com/Da4ndo/project-cleaner/releases/download/v2/project-cleaner-v2-x86_64-linux.tar.gz")
sha256sums=('a0674caddc98d2d0e0073856e83e7ff03e2d8ddd5399be58280e42de9ad56012')

package() {
  cd "${pkgname}-v${pkgver}-x86_64-linux"
  install -Dm755 "${pkgname}" "$pkgdir/usr/bin/${pkgname}"
  install -Dm644 clean.config.json "$pkgdir/etc/${pkgname}/clean.config.json"
}
