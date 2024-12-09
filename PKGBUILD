# Maintainer: devome <evinedeng@hotmail.com>

_pkgname=rapidocr-onnxruntime
_pipname="${_pkgname//-/_}"
pkgname="python-${_pkgname}"
pkgver=1.4.2
pkgrel=1
pkgdesc="A cross platform OCR Library based on OnnxRuntime."
arch=('any')
url="https://github.com/RapidAI/RapidOCR"
license=('Apache-2.0')
depends=(python-numpy python-onnxruntime python-opencv python-pillow python-pyclipper python-pyyaml python-shapely python-six python-tqdm)
makedepends=('python-installer')
source=("${_pipname}-${pkgver}-py3-none-any.whl::https://files.pythonhosted.org/packages/py3/${_pipname::1}/${_pkgname}/${_pipname}-${pkgver}-py3-none-any.whl")
sha256sums=('b921eea8cc8f203588e851d2f26e3ab5e8e9d7c7eec2fe3f7a264ae6275d7e28')
noextract=("${_pipname}-${pkgver}-py3-none-any.whl")

package() {
    python -m installer --destdir="${pkgdir}" "${_pipname}-${pkgver}-py3-none-any.whl"
}
