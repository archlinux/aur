# Maintainer: Maxim Andersson <thesilentboatman@gmail.com>

pkgname=python-progressbar2
_pkgname=python-progressbar
pkgver=3.9.1
pkgrel=1
pkgdesc="Progressbar library to provide visual (yet text based) progress to long running operations"
arch=('any')
url="https://github.com/WoLpH/python-progressbar"
license=('BSD')
depends=('python')
provides=('python-progressbar')
conflicts=('python-progressbar')
source=("https://github.com/WoLpH/${_pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('bf345cfe13b51964e33b85cd2a4361a9a9f09298e4882658a12cd0b6e052f2a6')

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1
}

# vim:set ts=2 sw=2 et:
