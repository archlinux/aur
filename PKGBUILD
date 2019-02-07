# Maintainer: Pig Monkey <pm@pig-monkey.com>

pkgbase=('python-undertime')
pkgname=('python-undertime')
_module='undertime'
pkgver='1.7.0'
pkgrel=1
pkgdesc="pick a meeting time"
url="https://gitlab.com/anarcat/undertime"
depends=('python-dateparser' 'python-pytz' 'python-pyaml' 'python-termcolor' 'python-terminaltables')
makedepends=('python-pip')
license=('AGPL3')
arch=('any')
source=("https://files.pythonhosted.org/packages/7e/8a/db4a168e016234d757d0f7456442dc95926c9361058d1590ed1719fc6deb/undertime-${pkgver}-py3-none-any.whl")
md5sums=('91852ae3e5834dce3632e5474c312c95')

package() {
    cd "${srcdir}/"
    PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps *.whl
}
