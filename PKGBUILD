# Maintainer: gonsolo@gmail.com
pkgname=yowasp-runtime
pkgver=1.83
pkgrel=1
pkgdesc="YOWASP runtime environment for executing WebAssembly modules"
arch=('any')
url="https://pypi.org/project/yowasp-runtime/"
license=('MIT')
depends=('python' 'wasmer')
makedepends=('python-pip' 'python-build' 'python-installer' 'python-wheel')
source=("https://files.pythonhosted.org/packages/py3/y/yowasp-runtime/yowasp_runtime-${pkgver}-py3-none-any.whl")
noextract=("yowasp_runtime-${pkgver}-py3-none-any.whl")
sha256sums=('4aba1e793c495cead1ff74b6ec8424bb02e2e94caaae2ee75ab6ee02d6ea786e')

package() {
  cd "${srcdir}"
  python -m installer --destdir="${pkgdir}" "yowasp_runtime-${pkgver}-py3-none-any.whl"
}

