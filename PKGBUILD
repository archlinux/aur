# Maintainer: robertfoster
_name=mediapipe
_py=cp311
pkgname=python-mediapipe-bin
pkgver=0.10.11
pkgrel=1
pkgdesc="A cross-platform, customizable ML solutions for live and streaming media"
arch=('x86_64')
url="https://github.com/google/mediapipe"
license=("Apache")
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
depends=('absl-py'
  'python'
  'python-cycler'
  'python-dateutil'
  'python-fonttools'
  'python-kiwisolver'
  'python-matplotlib'
  'python-opencv'
  'python-pillow'
  'python-protobuf'
  'python-wheel'
)
makedepends=('python-installer' 'python-wheel')

source=("https://files.pythonhosted.org/packages/c9/e4/3e645a8f87577553194a2a15383a60d61b8381cf864e903e43e4c6eb58e0/${_name//-/_}-$pkgver-$_py-${_py}-manylinux_2_17_x86_64.manylinux2014_x86_64.whl")

package() {
  python -m installer --destdir="$pkgdir" *.whl
}

sha256sums=('ea751e043909ba7bbe27e7afdbcdafd79723d50ef4165afcaae431ab428eea13')
