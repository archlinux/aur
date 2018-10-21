# Maintainer: getzze <getzze at gmail dot com>

pkgname=('python-ffmpeg')
_pkgname='ffmpeg-python'
pkgver=0.1.16
pkgrel=1
pkgdesc="Python bindings for FFmpeg - with complex filtering support"
arch=(any)
url="https://github.com/kkroening/ffmpeg-python"
license=('Apache')
options=(!emptydirs)
depends=("ffmpeg" "python-future")
source=("https://github.com/kkroening/ffmpeg-python/archive/${pkgver}.tar.gz")
sha256sums=('344039ef8d44a1f88741066e0560b2cacc7e7396201df839d0a702e929e9e05d')
makedepends=('git' 'python-setuptools' 'python-pytest-runner')


package() {
  cd "$srcdir/${_pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1
}
