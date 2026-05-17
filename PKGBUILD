pkgname=python312-python-discovery
pkgver=1.3.0
pkgrel=1
pkgdesc='Python discovery library for Python 3.12'
arch=('any')
url='https://github.com/tox-dev/python-discovery'
license=('MIT')
depends=('python312' 'python312-packaging')
makedepends=('python312-installer')
source=("python_discovery-1.3.0-py3-none-any.whl::https://files.pythonhosted.org/packages/30/d4/24d543ab8b8158b7f5a97113c831205f5c900c92c8762b1e7f44b7ea0405/python_discovery-1.3.0-py3-none-any.whl")
sha256sums=('441d9ced3dfce36e113beb35ca302c71c7ef06f3c0f9c227a0b9bb3bd49b9e9f')

package() {
  python3.12 -m installer --destdir="$pkgdir" "$srcdir/python_discovery-1.3.0-py3-none-any.whl"
}
