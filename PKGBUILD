# Maintainer: Pig Monkey <pm@pig-monkey.com>

pkgbase=python-undertime
pkgname=python-undertime
_module='undertime'
pkgver='1.8.0'
pkgrel=1
pkgdesc="pick a meeting time"
url="https://gitlab.com/anarcat/undertime"
depends=('python-dateparser' 'python-pytz' 'python-pyaml' 'python-termcolor' 'python-tabulate')
makedepends=('python-pip')
license=('AGPL3')
arch=('any')
source=("https://files.pythonhosted.org/packages/8f/81/3d6b5f0ccf22351c955c511f3f7436a4d0017bc659843286d62486ebbde7/undertime-${pkgver}-py3-none-any.whl")
md5sums=('388955f6bae01cc03a89e61aafc7615a')

package() {
    cd "${srcdir}/"
    PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps *.whl
}
