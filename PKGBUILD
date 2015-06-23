# Maintainer: Oleg Plakhotniuk <olegus EIGHT AT gmail DOT com>

pkgname=validatornu
pkgver=20141013
_pkgver2=20141006
pkgrel=1
pkgdesc="A command line tool for HTML5 markup validation"
arch=('any')
url="http://validator.github.io"
license=('custom')
depends=('java-environment' 'bash')
makedepends=('unzip')
source=('validatornu'
        "https://github.com/validator/validator/releases/download/${_pkgver2}/vnu-${pkgver}.jar.zip")
md5sums=('5de3977fa83926a7ce6fc96a3228d7f3'
         '631648b0b42fd5f955b5c8ee07bfe10c')

package() {
  cd "$srcdir/vnu"
  install -D "$srcdir/validatornu" "$pkgdir/usr/bin/validatornu"
  install -D -m644 vnu.jar "$pkgdir/usr/share/java/$pkgname/vnu.jar"
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -D -m644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -D -m644 index.html "$pkgdir/usr/share/doc/$pkgname/index.html"
}

# vim:set ts=2 sw=2 et:
