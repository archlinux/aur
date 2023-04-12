# Maintainer: Your Name <alberto.diazdorado@tngtech.com>
pkgname=please
_originpkgname=please-cli
pkgver=0.2.2
pkgrel=1
pkgdesc='An AI helper script to create CLI commands'
arch=('any')
url="https://github.com/TNG/$_originpkgname"
license=('Apache')
depends=('bash' 'jq')
source=("https://github.com/TNG/$_originpkgname/archive/refs/tags/v$pkgver.zip")
sha256sums=('6f86ef292211d5f76a122e14eadac6a39d32e5fde2e8287a5e824309d02252f1')

package() {
  cd "$srcdir"
  install -Dm755 $_originpkgname-$pkgver/please.sh "$pkgdir"/usr/bin/please
}
