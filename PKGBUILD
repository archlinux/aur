
# Maintainer: Donald Webster <fryfrog@gmail.com>

pkgname=python-ua-parser-builtins
_name=ua_parser_builtins
pkgver=202603
pkgrel=1
pkgdesc="The dataset of uap-core pre-compiled for use by ua-parser to decrease initialisation times."
arch=('any')
url="https://pypi.python.org/pypi/ua-parser-builtins"
license=('MIT')
makedepends=(python-installer python-wheel)
depends=('python')
source=("https://files.pythonhosted.org/packages/py3/${_name::1}/$_name/${_name//-/_}-$pkgver-py3-none-any.whl")
noextract=("*.whl")
sha256sums=('67478397a68fac1a98fd0a31c416ea7c65a719141fc151d0211316f2cd337cc9')

package() {
  cd "$srcdir"
  python -m installer --destdir="$pkgdir" *.whl
}
