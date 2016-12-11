# Maintainer: Maxim Andersson <thesilentboatman@gmail.com>

pkgname=python-progressbar2
_pkgname=python-progressbar
pkgver=3.11.0
pkgrel=1
pkgdesc="Progressbar library to provide visual (yet text based) progress to long running operations"
arch=('any')
url="https://github.com/WoLpH/python-progressbar"
license=('BSD')
depends=('python' 'python-utils')
provides=('python-progressbar')
conflicts=('python-progressbar')
#source=("https://github.com/WoLpH/${_pkgname}/archive/v${pkgver}.tar.gz")
source=("https://github.com/WoLpH/${_pkgname}/archive/e4c99940f33dd8227696d812c56d4cdabff79acc.zip")
sha256sums=('b0fbe51de6848608fe0cb9efe5cf975c29054f4c53ccdf3e8a41209472c85569')

package() {
  #cd "${srcdir}/${_pkgname}-${pkgver}"
  cd "${srcdir}/${_pkgname}-"*

  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1
}

# vim:set ts=2 sw=2 et:
