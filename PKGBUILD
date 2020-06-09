# Maintainer: qaz <fkxxyz@163.com>
# Contributor: qaz <fkxxyz@163.com>

pkgname=ssfconv
pkgver=1.0.0
pkgrel=1
pkgdesc="Sogou input method skin file (.ssf file) converter, supports conversion to fcitx 's format."
arch=('any')
url="https://www.fkxxyz.com/d/ssfconv/"
license=('GPL3')
depends=('python-pycryptodome' 'python-pillow' 'python-numpy')
source=("https://github.com/fkxxyz/ssfconv/archive/${pkgver}.tar.gz")
sha256sums=('93b2c8bc2e78f44b6b3ed7cb6e213d6359a4cb6111f7fbe2171b826927b5e0ce')

package() {
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}/ssfconv" \
    "${pkgdir}/usr/bin/${pkgname}"
}

# vim:set ts=2 sw=2 et:
