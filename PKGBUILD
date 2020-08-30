# Maintainer: qaz <fkxxyz@163.com>
# Contributor: qaz <fkxxyz@163.com>

pkgname=ssfconv
pkgver=1.1.1
pkgrel=1
pkgdesc="Sogou input method skin file (.ssf file) converter, supports conversion to fcitx 's format."
arch=('any')
url="https://www.fkxxyz.com/d/ssfconv/"
license=('GPL3')
depends=('python-pycryptodome' 'python-pillow' 'python-numpy')
source=("https://github.com/fkxxyz/ssfconv/archive/${pkgver}.tar.gz")
sha256sums=('a2183b789fbaa77183b34f7a1c27a377b78358afcd7b930835d1d74d298d1cd0')

package() {
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}/ssfconv" \
    "${pkgdir}/usr/bin/${pkgname}"
}

# vim:set ts=2 sw=2 et:
