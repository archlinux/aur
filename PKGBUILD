# Maintainer: getzze <getzze at gmail dot com>

pkgname=('python-ffmpeg')
_pkgname='ffmpeg-python'
pkgver=0.1.17
pkgrel=1
pkgdesc="Python bindings for FFmpeg - with complex filtering support"
arch=(any)
url="https://github.com/kkroening/ffmpeg-python"
license=('Apache')
options=(!emptydirs)
depends=("ffmpeg" "python-future")
source=("https://github.com/kkroening/ffmpeg-python/archive/${pkgver}.tar.gz")
sha256sums=('834a7820e23e85a2df1751910b9a20466a33051df4c9c613bfb440cd0fead885')
makedepends=('git' 'python-setuptools' 'python-pytest-runner')


package() {
  cd "$srcdir/${_pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1
}
