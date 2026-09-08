# Maintainer: Will Handley <wh260@cam.ac.uk>
# Contributor: Carl Smedstad <carsme@archlinux.org>

pkgname=python-outlines
_pkgname=outlines
pkgver=1.3.3
pkgrel=1
pkgdesc="Probabilistic Generative Model Programming"
arch=(any)
url="https://github.com/dottxt-ai/outlines"
license=(Apache-2.0)
depends=(
  python
  python-cloudpickle
  python-diskcache
  python-genson
  python-jinja
  python-jsonschema
  python-outlines-core
  python-pillow
  python-pydantic
  python-typing_extensions
)
makedepends=(
  python-installer
)
optdepends=(
  'python-transformers: transformers backend'
  'python-openai: OpenAI backend'
  'python-fastapi: deploy as LLM service'
  'uvicorn: deploy as LLM service'
  'python-airportsdata: airport-code dataset'
  'python-pycountry: country-code dataset'
)
source=("https://files.pythonhosted.org/packages/2b/2d/54727dcaa15ceb8279e0bcd9c06eb6f30e1b0147004359bf5a78f12cd85e/${_pkgname}-${pkgver}-py3-none-any.whl")
noextract=("${_pkgname}-${pkgver}-py3-none-any.whl")
sha256sums=('0e185dd5a0cfeb62e0268018972d3c22bb9b7d43db3dc1f39f3b754175a82c54')

package() {
  python -m installer --destdir="${pkgdir}" "${_pkgname}-${pkgver}-py3-none-any.whl"
}
