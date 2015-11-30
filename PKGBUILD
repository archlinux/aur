# Maintainer: Maxim Andersson <thesilentboatman@gmail.com>

pkgname=python-progressbar2
_pkgname=python-progressbar
pkgver=3.5.1
pkgrel=1
pkgdesc="Progressbar library to provide visual (yet text based) progress to long running operations"
arch=('any')
url="https://github.com/WoLpH/python-progressbar"
license=('BSD')
depends=('python')
conflicts=('python-progressbar')
source=("https://github.com/WoLpH/${_pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('047c3dde0bbc37c1446ff6d382268f55f46ba378a1f2b84a26970238916171f3')

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1
}

# vim:set ts=2 sw=2 et:
