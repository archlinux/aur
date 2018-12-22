# Maintainer: Pig Monkey <pm@pig-monkey.com>

pkgbase=('python-undertime')
pkgname=('python-undertime')
_module='undertime'
pkgver='1.5.0'
pkgrel=1
pkgdesc="pick a meeting time"
url="https://gitlab.com/anarcat/undertime"
makedepends=("python-pip")
depends=('python-parsedatetime' 'python-pytz' 'python-terminaltables' 'python-termcolor')
license=('AGPL3')
arch=('any')
source=("https://files.pythonhosted.org/packages/4f/9b/1ee545b11203e7b60ba0fac0a5b475161be6c891fb4ba72390530547bd12/undertime-${pkgver}-py3-none-any.whl")
md5sums=('da5ff7f782d14ab821ce3fe862821ca1')

package() {
    cd "${srcdir}/"
    PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps *.whl
}
