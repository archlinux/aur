# Maintainer: Pig Monkey <pm@pig-monkey.com>

pkgbase=python-undertime
pkgname=python-undertime
_module='undertime'
pkgver='2.0.0'
pkgrel=1
pkgdesc="pick a meeting time"
url="https://gitlab.com/anarcat/undertime"
depends=('python-dateparser' 'python-pytz' 'python-pyaml' 'python-termcolor' 'python-tabulate')
makedepends=('python-pip')
license=('AGPL3')
arch=('any')
source=("https://files.pythonhosted.org/packages/28/22/83d26e460fc550764e8096d324a299eb9379da10b6e351292890c7aa92f2/undertime-${pkgver}-py3-none-any.whl")
md5sums=('4ac09dd829169d427b004507b0a38fd6')

package() {
    cd "${srcdir}/"
    PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps *.whl
}
