# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=azure-cognitiveservices-speech
pkgname=python-$_name
pkgver=1.52.0
pkgrel=1
pkgdesc='Microsoft Cognitive Services Speech SDK for Python.'
arch=('x86_64' 'aarch64')
url='https://pypi.org/project/azure-cognitiveservices-speech'
license=('LicenseRef-Microsoft')
depends=('python' 'python-azure-core' 'glibc' 'libgcc' 'libstdc++' 'util-linux-libs' 'alsa-lib' 'gstreamer' 'glib2' 'libunwind' 'libelf' 'libffi' 'pcre2' 'xz' 'zlib' 'zstd' 'bzip2')
makedepends=('python-installer')
source_x86_64=("https://files.pythonhosted.org/packages/py3/${_name:0:1}/$_name/${_name//-/_}-$pkgver-py3-none-manylinux1_x86_64.whl")
source_aarch64=("https://files.pythonhosted.org/packages/py3/${_name:0:1}/$_name/${_name//-/_}-$pkgver-py3-none-manylinux2014_aarch64.whl")
noextract=("${_name//-/_}-$pkgver-py3-none-manylinux1_x86_64.whl"
           "${_name//-/_}-$pkgver-py3-none-manylinux2014_aarch64.whl")
sha256sums_x86_64=('baf3ae9bdd1e75336a22f859d854a3c0f9dd7078b9144f2d432441e77be9f91c')
sha256sums_aarch64=('ad4563b39f916da636de7780a00769d355c4d990f9fb2411d5200106489cd5e4')

package() {
  python -m installer --destdir="$pkgdir" *.whl
}
