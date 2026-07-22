# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=azure-cognitiveservices-speech
pkgname=python-$_name
pkgver=1.51.0
pkgrel=2
pkgdesc='Microsoft Cognitive Services Speech SDK for Python.'
arch=('x86_64' 'aarch64')
url='https://pypi.org/project/azure-cognitiveservices-speech'
license=('LicenseRef-Microsoft')
depends=('python' 'python-azure-core')
makedepends=('python-installer')
source_x86_64=("https://files.pythonhosted.org/packages/py3/${_name:0:1}/$_name/${_name//-/_}-$pkgver-py3-none-manylinux1_x86_64.whl")
source_aarch64=("https://files.pythonhosted.org/packages/py3/${_name:0:1}/$_name/${_name//-/_}-$pkgver-py3-none-manylinux2014_aarch64.whl")
noextract=("${_name//-/_}-$pkgver-py3-none-manylinux1_x86_64.whl"
           "${_name//-/_}-$pkgver-py3-none-manylinux2014_aarch64.whl")
sha256sums_x86_64=('ee254ee030f4f346406dcd0d3d33be2bfb745ed0764a9148c815fb1b07babd1e')
sha256sums_aarch64=('b332b4fa198f5693b77b8d35f26fc501a1c3b0babc1d67a5e0899af3ffc78563')

package() {
  python -m installer --destdir="$pkgdir" *.whl
}
