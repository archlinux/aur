# Maintainer: gonsolo@gmail.com
pkgname=python-yamlcore
_name=yamlcore
pkgver=0.0.4
pkgrel=1
pkgdesc="YAML 1.2 Core Schema Support for PyYAML"
arch=('any')
url="https://pypi.org/project/yamlcore/"
license=('MIT')
depends=('python' 'python-yaml')
makedepends=('python-build' 'python-installer' 'python-wheel')
source=("https://files.pythonhosted.org/packages/py3/y/yamlcore/yamlcore-${pkgver}-py3-none-any.whl")
noextract=("yamlcore-${pkgver}-py3-none-any.whl")
sha256sums=('SKIP')  # Replace with actual checksum after download

package() {
  cd "${srcdir}"
  python -m installer --destdir="${pkgdir}" "yamlcore-${pkgver}-py3-none-any.whl"
}

