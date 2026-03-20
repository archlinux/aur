# Maintainer: Will Handley <wh260@cam.ac.uk>
# Contributor: Carl Smedstad <carsme@archlinux.org>

pkgname=python-outlines
_pkgname=outlines
pkgver=0.1.11
pkgrel=1
pkgdesc="Probabilistic Generative Model Programming"
arch=(any)
url="https://github.com/dottxt-ai/outlines"
license=(Apache-2.0)
depends=(
  python
  python-airportsdata
  python-cloudpickle
  python-diskcache
  python-interegular
  python-jinja
  python-jsonschema
  python-lark
  python-nest-asyncio
  python-numpy
  python-outlines-core
  python-pycountry
  python-pydantic
  python-pytorch
  python-referencing
  python-requests
  python-tqdm
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
)
source=("https://files.pythonhosted.org/packages/13/b4/99ea4a122bef60e3fd6402d19665aff1f928e0daf8fac3044d0b73f72003/${_pkgname}-${pkgver}-py3-none-any.whl")
noextract=("${_pkgname}-${pkgver}-py3-none-any.whl")
sha256sums=('f5a5f2242ed9802d3aab7a92789bf4008d734c576be9258cc0a297f690124727')

package() {
  python -m installer --destdir="${pkgdir}" "${_pkgname}-${pkgver}-py3-none-any.whl"
}
