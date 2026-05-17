pkgname=python312-cfgv
pkgver=3.5.0
pkgrel=1
pkgdesc='Validate configuration and produce human readable error messages for Python 3.12'
arch=('any')
url='https://github.com/asottile/cfgv'
license=('MIT')
depends=('python312')
makedepends=('python312-installer')
source=("cfgv-3.5.0-py2.py3-none-any.whl::https://files.pythonhosted.org/packages/db/3c/33bac158f8ab7f89b2e59426d5fe2e4f63f7ed25df84c036890172b412b5/cfgv-3.5.0-py2.py3-none-any.whl")
sha256sums=('a8dc6b26ad22ff227d2634a65cb388215ce6cc96bbcc5cfde7641ae87e8dacc0')

package() {
  python3.12 -m installer --destdir="$pkgdir" "$srcdir/cfgv-3.5.0-py2.py3-none-any.whl"
}
