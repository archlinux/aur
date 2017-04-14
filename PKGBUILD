# Maintainer: Yauheni Kirylau <actionless.loveless@gmail.com>

pkgname='pass-extension-tail'
pkgver=1.1.0
pkgrel=1
pkgdesc='A pass extension to avoid printing the password to the console .'
arch=('any')
url='https://github.com/palortoff/pass-extension-tail'
license=('GPL3')
depends=('pass')
source=(https://github.com/palortoff/pass-extension-tail/archive/v${pkgver}.tar.gz)
sha512sums=('SKIP')

package() {
  cd "${srcdir}/pass-extension-tail-${pkgver}/"
  mkdir -p ${pkgdir}/usr/lib/password-store/extensions/
  cp src/tail{,edit}.bash ${pkgdir}/usr/lib/password-store/extensions/
  mkdir -p ${pkgdir}/usr/share/man/man1/
  cp man/pass-extension-tail.1 ${pkgdir}/usr/share/man/man1/
}
