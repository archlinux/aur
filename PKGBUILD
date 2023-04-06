# Maintainer: Your Name <alberto.diazdorado@tngtech.com>
pkgname=please
_originpkgname=please-cli
pkgver=1.0.0
pkgrel=1
pkgdesc='An AI helper script to create CLI commands'
arch=('any')
url="https://github.com/TNG/$_originpkgname"
license=('Apache')
depends=('bash' 'jq')
source=("https://github.com/TNG/$_originpkgname/archive/refs/tags/v$pkgver.zip")
sha256sums=('288d75e1470caa3d4939e8bd495d80804ec02efa3d0ef86344419c3fac34ed4a')

package() {
  cd "$srcdir"
  install -Dm755 $_originpkgname-$pkgver/please.sh "$pkgdir"/usr/bin/please
}
