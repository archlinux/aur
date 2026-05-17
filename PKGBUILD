pkgname=python312-distlib
pkgver=0.4.0
pkgrel=1
pkgdesc='Low-level components of distutils2/packaging for Python 3.12'
arch=('any')
url='https://github.com/pypa/distlib'
license=('Python-2.0')
depends=('python312')
makedepends=('python312-installer')
source=("distlib-0.4.0-py2.py3-none-any.whl::https://files.pythonhosted.org/packages/33/6b/e0547afaf41bf2c42e52430072fa5658766e3d65bd4b03a563d1b6336f57/distlib-0.4.0-py2.py3-none-any.whl")
sha256sums=('9659f7d87e46584a30b5780e43ac7a2143098441670ff0a49d5f9034c54a6c16')

package() {
  python3.12 -m installer --destdir="$pkgdir" "$srcdir/distlib-0.4.0-py2.py3-none-any.whl"
}
