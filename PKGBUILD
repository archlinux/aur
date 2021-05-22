# Maintainer: Morteza NourelahiAlamdari <m@0t1.me>

pkgname="python-bench-it"
pkgver="1.0.1"
pkgrel=1
pkgdesc="Quick and easy python benchmarking"
arch=("any")
url="https://github.com/scuml/benchit"
filename="bench_it-1.0.1-py2.py3-none-any.whl"
source=("https://files.pythonhosted.org/packages/e3/c4/7f91020f875a0e7f1ca880b5ac7c047e021366408f608e106c60799670e8/$filename")
sha256sums=("d7f588f99de025735f00e24c8bc56b32da0a86f2e9fa6fe97befaa878cca2a46")
license=("MIT")
depends=("python")
makedepends=("python-pip")
conflicts=("python-benchit")

package() {
  pip install "${filename}" --root="${pkgdir}/"
}
