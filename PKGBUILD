# Maintainer: gonsolo@gmail.com
pkgname=yowasp-yosys
pkgver=0.56.0.0.post964
pkgrel=1
pkgdesc="Yosys built for WebAssembly via YOWASP (installed from PyPI)"
arch=('any')
url="https://pypi.org/project/yowasp-yosys/"
license=('MIT')
depends=('python' 'wasmer')
makedepends=('python-pip' 'python-build' 'python-installer' 'python-wheel')
source=("https://files.pythonhosted.org/packages/py3/y/yowasp-yosys/yowasp_yosys-${pkgver}-py3-none-any.whl")
noextract=("yowasp_yosys-${pkgver}-py3-none-any.whl")
sha256sums=('0375f406b7acbe6730893ee4191e1910fed32e7c586fa8c4e5abe0b2cf6bf0a7')

package() {
  cd "${srcdir}"
  python -m installer --destdir="${pkgdir}" "yowasp_yosys-${pkgver}-py3-none-any.whl"
}

