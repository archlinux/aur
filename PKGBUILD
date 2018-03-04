# Maintainer: Yauheni Kirylau <actionless.loveless@gmail.com>

pkgname='pass-extension-tail'
pkgver=1.1.1
pkgrel=1
pkgdesc='A pass extension to avoid printing the password to the console .'
arch=('any')
url='https://github.com/palortoff/pass-extension-tail'
license=('GPL3')
depends=('pass')
source=(https://github.com/palortoff/pass-extension-tail/archive/v${pkgver}.tar.gz)
sha512sums=('f7746da93486be9d30e920cc2f0590d14d7a6126a30737e5973c27db60e1c76f557777f2ed12825f8ee10712b9217dd7c1f408c9a5990edf3daaaa78c754b650')

package() {
  cd "${srcdir}/pass-extension-tail-${pkgver}/"
  mkdir -p ${pkgdir}/usr/lib/password-store/extensions/
  cp src/tail{,edit}.bash ${pkgdir}/usr/lib/password-store/extensions/
  mkdir -p ${pkgdir}/usr/share/man/man1/
  cp man/pass-extension-tail.1 ${pkgdir}/usr/share/man/man1/
}
