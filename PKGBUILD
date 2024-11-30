# Maintainer: envolution
# shellcheck shell=bash disable=SC2034,SC2154
pkgname=python-vllm-bin
_pkgname=vllm
pkgver=0.6.4.post1
pkgrel=3
pkgdesc="faster implementation for TTS models, to be used in highly async environment"
arch=('x86_64')
url='https://github.com/vllm-project/vllm'
provides=(python-vllm)
conflicts=(python-vllm)
license=(Apache-2.0)
depends=(python-installer python)
source=("https://github.com/vllm-project/vllm/releases/download/v${pkgver}/vllm-${pkgver}+cu118-cp38-abi3-manylinux1_x86_64.whl")
noextract=("vllm-${pkgver}+cu118-cp38-abi3-manylinux1_x86_64.whl")
sha256sums=('8b9b1a7785acf1d85f1c2eea53fe929ed32d5e9707c130d98a5998248dd67b5d')

package() {
  python -m installer --destdir="${pkgdir}" vllm-${pkgver}+cu118-cp38-abi3-manylinux1_x86_64.whl
}
# vim:set ts=2 sw=2 et:
