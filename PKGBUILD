# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=azure-cognitiveservices-speech
pkgname=python-$_name
pkgver=1.51.1
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
sha256sums_x86_64=('a5f19f2fa4a11fbf299db2c179a5149fefe624a9a88ef1783c2d410c46d22dad')
sha256sums_aarch64=('2f0a8a15693399433b25a66e01dfb48c4404c91bcd23e963f67dcd2997d1855d')

package() {
  python -m installer --destdir="$pkgdir" *.whl
}
