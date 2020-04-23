# Maintainer: Pig Monkey <pm@pig-monkey.com>

pkgbase=python-undertime
pkgname=python-undertime
_module='undertime'
pkgver='2.1.0'
pkgrel=1
pkgdesc="pick a meeting time"
url="https://gitlab.com/anarcat/undertime"
depends=('python-dateparser' 'python-pytz' 'python-pyaml' 'python-termcolor' 'python-tabulate')
makedepends=('python-pip')
license=('AGPL3')
arch=('any')
source=("https://files.pythonhosted.org/packages/71/0e/6a3329ce186428088aa29e7a38a4329872917b728a196e51219205d3e107/undertime-${pkgver}-py3-none-any.whl")
md5sums=('4d377bcbd78ca036234d5221d15624a5')

package() {
    cd "${srcdir}/"
    PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps *.whl
}
