# Maintainer: envolution
# shellcheck shell=bash disable=SC2034,SC2154
pkgname=python-vllm
_pkgname=vllm
pkgver=0.6.4.post1
pkgrel=1
pkgdesc="faster implementation for TTS models, to be used in highly async environment"
arch=('i686' 'x86_64')
url='https://httpstan.readthedocs.org'
license=(Apache-2.0)
depends=(python-installer python python-safetensors python-numpy python-transformers python-tokenizers)
source=("https://files.pythonhosted.org/packages/06/ab/2d562d5d4475f1a071b831564971752c085830793a6d9033383926d5eb9c/vllm-${pkgver}-cp38-abi3-manylinux1_x86_64.whl")
noextract=("vllm-${pkgver}-cp38-abi3-manylinux1_x86_64.whl")
sha256sums=('dc151793688376904ca54129a4aa0b83aed9d7ad8e458666775f62b37ecbddcc')

package() {
  python -m pip install --no-deps --root="${pkgdir}" vllm-${pkgver}-cp38-abi3-manylinux1_x86_64.whl --break-system-packages --no-warn-script-location --ignore-installed
}
# vim:set ts=2 sw=2 et:
