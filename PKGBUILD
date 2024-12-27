# Maintainer: envolution
# shellcheck shell=bash disable=SC2034,SC2154
pkgname=python-vllm-bin
_pkgname=vllm
pkgver=0.6.6
pkgrel=4
pkgdesc="faster implementation for TTS models, to be used in highly async environment"
arch=('x86_64')
url='https://github.com/vllm-project/vllm'
provides=(python-vllm)
conflicts=(python-vllm)
license=(Apache-2.0)
depends=(python-installer python)
source=("https://github.com/vllm-project/vllm/releases/download/v${pkgver}/vllm-${pkgver}+cu118-cp38-abi3-manylinux1_x86_64.whl")
noextract=("vllm-${pkgver}+cu118-cp38-abi3-manylinux1_x86_64.whl")
sha256sums=('77d2116bc1d9ea03fd6b8612f0667c53918940c22340197c9a21f16734c2d98b')

package() {
  python -m installer --destdir="${pkgdir}" vllm-${pkgver}+cu118-cp38-abi3-manylinux1_x86_64.whl
}
# vim:set ts=2 sw=2 et:
