# Maintainer: Pig Monkey <pm@pig-monkey.com>

pkgbase=python-undertime
pkgname=python-undertime
_module='undertime'
pkgver='2.2.0'
pkgrel=1
pkgdesc="pick a meeting time"
url="https://gitlab.com/anarcat/undertime"
depends=('python-dateparser' 'python-pytz' 'python-pyaml' 'python-termcolor' 'python-tabulate')
makedepends=('python-pip')
license=('AGPL3')
arch=('any')
source=("https://files.pythonhosted.org/packages/24/1a/f08f834f20089ecfb0d98e46e789dc6d8d0c4aa9bdce60b7b0cc730d6ca1/undertime-${pkgver}-py3-none-any.whl")
md5sums=('caa38d062ff1e332804ccde058590825')

package() {
    cd "${srcdir}/"
    PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps *.whl
}
