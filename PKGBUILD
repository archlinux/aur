# Maintainer: gonsolo@gmail.com
pkgname=yowasp-yosys
pkgver=0.70.0.0.post1259
pkgrel=1
pkgdesc="Yosys built for WebAssembly via YOWASP (installed from PyPI)"
arch=('any')
url="https://pypi.org/project/yowasp-yosys/"
license=('MIT')
depends=('python' 'wasmer')
makedepends=('python-pip' 'python-build' 'python-installer' 'python-wheel')
source=("https://files.pythonhosted.org/packages/py3/y/yowasp-yosys/yowasp_yosys-${pkgver}-py3-none-any.whl")
noextract=("yowasp_yosys-${pkgver}-py3-none-any.whl")
sha256sums=('38a5ce6af95045b5b1ad795de7a73cfe88cf70c19f7b95f027f4a377a85310c0')

package() {
  cd "${srcdir}"
  python -m installer --destdir="${pkgdir}" "yowasp_yosys-${pkgver}-py3-none-any.whl"
}

