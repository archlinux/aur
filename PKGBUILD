# Maintainer: Maxim Andersson <thesilentboatman@gmail.com>

pkgname=python-progressbar2
_pkgname=python-progressbar
pkgver=3.30.0
pkgrel=1
pkgdesc="Progressbar library to provide visual (yet text based) progress to long running operations"
arch=('any')
url="https://github.com/WoLpH/python-progressbar"
license=('BSD')
depends=('python' 'python-utils')
makedepends=('python-setuptools')
provides=('python-progressbar')
conflicts=('python-progressbar')
source=("https://github.com/WoLpH/${_pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('2bf0ba53cffe447d1abff5d115d3a1d1356e8e42bec5569e3822f9df3dde365e')

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1
}

# vim:set ts=2 sw=2 et:
