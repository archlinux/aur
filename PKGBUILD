# Maintainer: Michael Clayfield <me@michaelclayfield.com>

pkgname=icingaweb2-module-reactbundle
pkgver=0.7.0
pkgrel=1
pkgdesc="ReactPHP-based 3rd party libraries for Icinga Web 2"
license=('GPL')
arch=('any')
depends=('icingaweb2')
url="http://www.icinga.org"
source=("https://github.com/Icinga/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('e57710bbc3f8422740c36211612df572133ddd141d4eda54b9e295481d5efdbb')

package() {
  cd "$srcdir/$pkgname-$pkgver"

  mkdir -p "$pkgdir/etc/icingaweb2/modules/reactbundle"
  mkdir -p "$pkgdir/usr/share/webapps/icingaweb2/modules/reactbundle"

  cp -r vendor composer.json composer.lock module.info run.php \
    "$pkgdir/usr/share/webapps/icingaweb2/modules/reactbundle"
}
