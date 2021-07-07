# Maintainer: mcgyver <newsletter.sergio@gmail.com>

pkgbase=python-flynn
pkgname=('python-flynn')
_name=${pkgbase#python-}
pkgver=1.0.0b2
pkgrel=1
pkgdesc="Flynn is a Python library providing CBOR [RFC7049] encoding and decoding with a traditional buffered and a streaming interface."
arch=('any')
url="https://pypi.org/project/flynn/#files"
license=('MIT')
makedepends=("python" 'python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('bb0004e3f6924b3148e3b537988356875c669fb502696fb2f5e366d7297b02d2')

package_python-flynn() {
  depends+=('python')

  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py install --root="${pkgdir}"
}


