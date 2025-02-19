# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=gradio-pdf
pkgname=python-${_name}
pkgver=0.0.22
pkgrel=1
pkgdesc='Easily display PDFs in Gradio.'
arch=(any)
url='https://github.com/freddyaboulton/gradio-pdf'
license=('MIT')
source=("https://files.pythonhosted.org/packages/py3/${_name::1}/$_name/${_name//-/_}-$pkgver-py3-none-any.whl")
sha256sums=('6f710eca3464d2d37aee742eb2f10dbe76772ebe5dfcfb993da40c710c9ad1b5')
depends=('python>=3.8' 'python-gradio')
makedepends=('python-hatchling' 'python-hatch-requirements-txt' 'python-hatch-fancy-pypi-readme')

package() {
  python -m installer --destdir="$pkgdir" *.whl
}
