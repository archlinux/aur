# Maintainer: Matthew Sexton <mssxtn@gmail.com>

pkgname=python-gpt4all
_name=gpt4all
pkgver=2.2.1
pkgrel=1
pkgdesc="Python binding for gpt4all"
arch=('any')
url="https://pypi.org/project/gpt4all/"
license=('MIT')
depends=( )
makedepends=('python-installer')
source=("https://files.pythonhosted.org/packages/dd/35/5845e8a2ffcb5c13cffffa750d8ac8b70909e43b2ca725031855bbd240cf/gpt4all-2.2.1-py3-none-manylinux1_x86_64.whl")
sha256sums=('bd5c24997cc036569baa4365d0c5a5648939981371869db7863d1d931cd8fa78')


package() {
  python -m installer --destdir="$pkgdir" "gpt4all-$pkgver-py3-none-manylinux1_x86_64.whl"
}
