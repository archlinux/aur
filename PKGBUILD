# Maintainer: Peter Hoeg <first name at last name dot com>

pkgname=modman
pkgver=1.12
pkgrel=2
pkgdesc="Magento Module Manager"
arch=("any")
url="https://github.com/colinmollenhour/${pkgname}"
license=('GPL')
depends=('bash')
makedepends=('unzip')
source=("${url}/archive/${pkgver}.zip")
sha1sums=('fdfaa44335214744b91e74fdbe31204dea92d9dc')

package() {
  cd "$srcdir/${pkgname}-${pkgver}"

  install -Dm664 README.md       "$pkgdir/usr/share/doc/${pkgname}/README.md"
  install -Dm664 bash_completion "$pkgdir/usr/share/bash-completion/completions/${pkgname}"
  install -Dm755 $pkgname        "$pkgdir/usr/bin/${pkgname}"
}
