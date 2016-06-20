# Maintainer: Maxim Andersson <thesilentboatman@gmail.com>

pkgname=python-progressbar2
_pkgname=python-progressbar
pkgver=3.8.0
pkgrel=1
pkgdesc="Progressbar library to provide visual (yet text based) progress to long running operations"
arch=('any')
url="https://github.com/WoLpH/python-progressbar"
license=('BSD')
depends=('python')
provides=('python-progressbar')
conflicts=('python-progressbar')
source=("https://github.com/WoLpH/${_pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('29571a9bfe1ee386b7bd052aece522f802c6479aaeabffa84de739845fa2a3bb')

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1
}

# vim:set ts=2 sw=2 et:
