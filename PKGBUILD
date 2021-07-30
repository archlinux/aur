pkgname=python-sonicprobe
pkgver=0.3.41
pkgrel=1
pkgdesc=''
arch=('any')
url="https://github.com/decryptus/sonicprobe"
license=('GPL3')
depends=(
  'python'
  'python-pyopenssl'
  'python-magic'
  'python-psutil'
  'python-pycurl'
  'python-yaml'
  'python-unidecode'
  'python-semantic-version'
  'python-six'
)
makedepends=('python-pip')
source=("https://files.pythonhosted.org/packages/py3/s/$pkgname/${pkgname/-/_}-$pkgver-py3-none-any.whl")
md5sums=('6dbec591364d28dc1f73508624d4c466')

package() {
	pip install --root="$pkgdir" --ignore-installed --no-deps "$srcdir/${pkgname/-/_}-$pkgver-py3-none-any.whl"
}
