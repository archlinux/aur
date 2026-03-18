# Maintainer: Will Handley <wh260@cam.ac.uk>
pkgname=python-sgl-kernel
_pkgname=sgl_kernel
pkgver=0.3.21
pkgrel=1
pkgdesc='Compiled CUDA kernels for the SGLang serving framework'
arch=('x86_64')
url='https://github.com/sgl-project/sglang/tree/main/sgl-kernel'
license=('Apache-2.0')
depends=('python>=3.10')
makedepends=('python-installer')
options=('!strip')
_whl="${_pkgname}-${pkgver}-cp310-abi3-manylinux2014_x86_64.whl"
noextract=("${_whl}")
source=("${_whl}::https://files.pythonhosted.org/packages/36/9f/f836e126002c7cfcfe35418f6cff5a63fe3f529c609b334ca4775354b4d5/${_whl}")
sha256sums=('57dfb3a2a3cd759f499c32e2bad5f6489b7c58f7f9a84ee00c53ec92d303aaab')

package() {
  python -m installer --destdir="${pkgdir}" "${_whl}"
}
