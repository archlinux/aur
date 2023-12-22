# Maintainer: Matthew Sexton <mssxtn@gmail.com>

pkgname=python-gpt4all
_name=gpt4all
pkgver=2.0.2
pkgrel=1
pkgdesc="Python binding for gpt4all"
arch=('any')
url="https://pypi.org/project/gpt4all/"
license=('MIT')
depends=( )
makedepends=('python-installer')
source=("https://files.pythonhosted.org/packages/a3/cc/384d8d02f2ff12f7432724fab598b5f88cb6d59bd4a8cee21c1043c60a5a/gpt4all-2.0.2-py3-none-manylinux1_x86_64.whl")
sha256sums=('e4c19df94f45829565563017577b299c012ebed18ebea1d6df0273ef89c92a01')


package() {
  python -m installer --destdir="$pkgdir" gpt4all-2.0.2-py3-none-manylinux1_x86_64.whl
}
