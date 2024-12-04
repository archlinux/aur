# Maintainer: devome <evinedeng@hotmail.com>

_pkgname=rapidocr-onnxruntime
_pipname="${_pkgname//-/_}"
pkgname="python-${_pkgname}"
pkgver=1.4.1
pkgrel=1
pkgdesc="A cross platform OCR Library based on OnnxRuntime."
arch=('any')
url="https://github.com/RapidAI/RapidOCR"
license=('Apache-2.0')
depends=(python-numpy python-onnxruntime python-opencv python-pillow python-pyclipper python-pyyaml python-shapely python-six python-tqdm)
makedepends=('python-installer')
source=("${_pipname}-${pkgver}-py3-none-any.whl::https://files.pythonhosted.org/packages/py3/${_pipname::1}/${_pkgname}/${_pipname}-${pkgver}-py3-none-any.whl")
sha256sums=('5ecdb8f4f3beec56630197f87c3e67ab744fce0cc66394b7b1da08c8c96a727f')
noextract=("${_pipname}-${pkgver}-py3-none-any.whl")

package() {
    python -m installer --destdir="${pkgdir}" "${_pipname}-${pkgver}-py3-none-any.whl"
}
