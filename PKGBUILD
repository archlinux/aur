# Maintainer: envolution
# shellcheck shell=bash disable=SC2034,SC2154
pkgname=python-vllm-bin
_pkgname=vllm
pkgver=0.7.0
pkgrel=4
pkgdesc="high-throughput and memory-efficient inference and serving engine for LLMs"
arch=('x86_64')
url='https://github.com/vllm-project/vllm'
provides=(python-vllm)
conflicts=(python-vllm)
license=(Apache-2.0)
depends=(python-installer python)
source=("https://github.com/vllm-project/vllm/releases/download/v${pkgver}/vllm-${pkgver}+cu118-cp38-abi3-manylinux1_x86_64.whl")
noextract=("vllm-${pkgver}+cu118-cp38-abi3-manylinux1_x86_64.whl")
sha256sums=('4dc7a722d66ae15cf1afdaa7d40ecb29445d604818192446589cdf5aee9742df')

package() {
  python -m installer --destdir="${pkgdir}" vllm-${pkgver}+cu118-cp38-abi3-manylinux1_x86_64.whl
}
# vim:set ts=2 sw=2 et:
