# Maintainer: Matthew Sexton <Matthew@asylumtech.com>

pkgname=python-gpt4all
_name=gpt4all
pkgver=2.8.2
pkgrel=1
pkgdesc="Python binding for gpt4all"
arch=('any')
url="https://pypi.org/project/gpt4all/"
license=('MIT')
depends=( )
makedepends=('python-installer')
source=("https://files.pythonhosted.org/packages/93/60/ef1efd83c5757a69e8ed842b8a12b091e94a9bb2ceacc8b6e1c2e6487a77/gpt4all-2.8.2-py3-none-manylinux1_x86_64.whl")
sha256sums=('c61e977afa72475c076211fd9b59a88334fc0062615be8c2f7716363a21fbafa')


package() {
  python -m installer --destdir="$pkgdir" "gpt4all-$pkgver-py3-none-manylinux1_x86_64.whl"
}
