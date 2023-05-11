# Maintainer: Qiu Wenbo <crab2313@gmail.com>

pkgname=python-reprint
pkgver=0.6.0
pkgrel=1
pkgdesc="a Python 2/3 module for binding variables and refreshing multi-line output in terminal."
arch=(any)
url="https://github.com/Yinzo/reprint"
license=('Apache')
depends=('python' 
	'python-colorama'
	'python-six'
	'python-backports.shutil_get_terminal_size'
)
makedepends=('python-setuptools')
_commit='f9e2669d40c70046e83962a9a5b4710d14f944a8'
source=("${pkgname}::git+https://github.com/Yinzo/reprint.git?commit=${_commit}")
sha256sums=('SKIP')


package() {
  cd "$pkgname"
  python setup.py install --root="$pkgdir/" --optimize=1
}
