# Contributor: Oleg Plakhotniuk <olegus EIGHT AT gmail DOT com>
# Maintainer: Simon Legner <Simon.Legner@gmail.com>

pkgname=validatornu
pkgver=17.11.1
pkgrel=1
pkgdesc="The Nu Html Checker, a command line tool for HTML5 markup validation"
arch=('any')
url="https://validator.github.io/validator/"
license=('custom')
depends=('java-environment')
makedepends=('unzip')
source=('validatornu'
        "https://github.com/validator/validator/releases/download/${pkgver}/vnu.jar_${pkgver}.zip")

package() {
  cd "$srcdir/dist"
  install -D "$srcdir/validatornu" "$pkgdir/usr/bin/validatornu"
  install -D -m644 vnu.jar "$pkgdir/usr/share/java/$pkgname/vnu.jar"
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -D -m644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -D -m644 index.html "$pkgdir/usr/share/doc/$pkgname/index.html"
}

# vim:set ts=2 sw=2 et:
sha256sums=('2bd7de0a9e3a11bf146fe395ed25380ff47b3d28396cbb9e008a48bb3b8056d7'
            'aaa5b27cce1d10fb4a48099041396a18bd55f8f982c595e0ffcdff1f1d4aedb8')
