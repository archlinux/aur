# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=bithuman
pkgname=python-$_name
_py=cp314
pkgver=2.3.9
pkgrel=1
pkgdesc='bitHuman Python SDK — libessence-backed avatar runtime.'
arch=('any')
url='https://github.com/bithuman-product/bithuman-sdk-public/tree/main/python'
license=('custom')
depends=('python' 'python-numpy' 'python-loguru' 'python-soundfile' 'python-pydantic' 'python-pydantic-settings' 'python-av' 'python-opencv' 'zlib' 'libstdc++' 'glibc' 'libgcc')
makedepends=('python-installer')
source_x86_64=("https://files.pythonhosted.org/packages/$_py/${_name::1}/$_name/$_name-$pkgver-$_py-$_py-manylinux_2_28_x86_64.whl")
source_aarch64=("https://files.pythonhosted.org/packages/$_py/${_name::1}/$_name/$_name-$pkgver-$_py-$_py-manylinux_2_28_aarch64.whl")
noextract=("$_name-$pkgver-$_py-$_py-manylinux_2_28_x86_64.whl"
           "$_name-$pkgver-$_py-$_py-manylinux_2_28_aarch64.whl")
sha256sums_x86_64=('725899f409bc6a85ec214c5dd6cd5af740c02ce1cdc2357d49de30b379b202ae')
sha256sums_aarch64=('408f758ac02c4323e63abbecc91fbea30374bb7809e386fdf7e6b7c68340f644')

package() {
  python -m installer --destdir="$pkgdir" *.whl
}
