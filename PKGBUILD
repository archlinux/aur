# Maintainer: Yngve Levinsen <yngve AT levinsen DOT gmail>
# Contributor: Vincent Pasquier <vincentpasquier@posteo.net>

pkgname=python-ics
pkgver=0.4
pkgrel=1
pkgdesc='Pythonic and easy iCalendar library'
arch=('any')
url='http://pypi.python.org/pypi/ics/'
license=('Apache')
depends=('python' 'python-arrow' 'python-dateutil')
makedepends=('python-setuptools')

source=("https://files.pythonhosted.org/packages/f5/d4/e14e5b17aca858ad53210c0342fe0a4b1f46dffe3e2e31961b34ad7c4fab/ics-${pkgver}.tar.gz")
sha512sums=('8b716048421a2eb653d220313fb2355781172b219fe7bd99bf1f4084711934874a7f3931cf5cd0852c3c42a725b5219251cb1fb222cf8a37c25921e903c211be')

package() {
  cd "ics-${pkgver}"
  python setup.py install --root=${pkgdir} --optimize=1
}

# vim:set ts=2 sw=2 et:
