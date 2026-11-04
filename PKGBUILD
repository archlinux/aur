# Maintainer: robertfoster
_name=mediapipe
pkgname=python-mediapipe-bin
pkgver=1.2.2 # renovate: datasource=pypi depName=mediapipe
pkgrel=1
pkgdesc="A cross-platform, customizable ML solutions for live and streaming media"
arch=('x86_64')
url="https://github.com/google/mediapipe"
license=('Apache-2.0')
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
source=("https://files.pythonhosted.org/packages/py3/${_name::1}/${_name}/${_name//-/_}-$pkgver-py3-none-manylinux_2_28_x86_64.whl")

package() {
  python -m installer --destdir="$pkgdir" *.whl
}

sha256sums=('c0b641bf1515dd186036da711df597a514466c0ba97a138f35b698ecc0411a61')
