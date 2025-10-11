# Maintainer: vyrx <theamit.969@gmail.com>
pkgname=omarchy-styles
pkgver=1.1.0
pkgrel=2
pkgdesc="Interactive  theme installer for Omarchy"
arch=('any')
url="https://github.com/vyrx-dev/omarchy-styles"
license=('MIT')
depends=('gum' 'jq' 'curl' 'chafa')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/vyrx-dev/omarchy-styles/archive/v${pkgver}.tar.gz")
sha256sums=('SKIP')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 "omarchy-styles.sh" \
    "$pkgdir/usr/bin/ostyles"
}
