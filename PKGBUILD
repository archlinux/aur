# Maintainer: Maxim Andersson <thesilentboatman@gmail.com>

pkgname=python-progressbar2
_pkgname=python-progressbar
pkgver=3.20.0
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
sha256sums=('4edb0d57e0eb2cc580a4ed73b1052d2f3359e06d28a83abcbbf8b0d31ee9ddf7')

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1
}

# vim:set ts=2 sw=2 et:
