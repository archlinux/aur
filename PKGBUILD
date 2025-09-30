# Maintainer: vyrx <theamit.969@gmail.com>
pkgname=omarchy-styles
pkgver=1.0.0
pkgrel=1
pkgdesc="Interactive TUI theme selector for omarchy themes"
arch=('any')
url="https://github.com/vyrx-dev/omarchy-styles"
license=('MIT')
depends=('gum' 'jq' 'curl')
source=("omarchy-styles.sh")
sha256sums=('SKIP')

package() {
  install -Dm755 "$srcdir/omarchy-styles.sh" \
    "$pkgdir/usr/bin/ostyles"
}
