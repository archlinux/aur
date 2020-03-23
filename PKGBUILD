# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=socli
pkgver=3.8
pkgrel=1
pkgdesc="Stack overflow command line client. Search and browse stack overflow without leaving the terminal"
arch=('any')
url='https://pypi.python.org/pypi/socli'
license=('BSD-3-Clause')
depends=('python-beautifulsoup4'
		 'python-requests'
		 'python-colorama'
		 'python-py-stackexchange'
		 'python-urwid')
makedepends=('python-setuptools')
source=("https://github.com/gautamkrishnar/socli/archive/${pkgver}.tar.gz")
md5sums=('d7b9260ce21e0c5815ac1095a058ca23')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py install --root="$pkgdir/" --optimize=1
}