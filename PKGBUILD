# Maintainer: robertfoster
_name=mediapipe
pkgname=python-mediapipe-bin # renovate: datasource=github-tags depName=google-ai-edge/mediapipe
pkgver=0.10.32
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
source=("https://files.pythonhosted.org/packages/e3/98/00cd8b2dcb563f2298655633e6611a791b2c1a7df1dae064b2b96084f1bf/${_name//-/_}-$pkgver-py3-none-manylinux_2_28_x86_64.whl")

package() {
  python -m installer --destdir="$pkgdir" *.whl
}

sha256sums=('4b0941fbbbce41862f13cb1850c4878c13dbc62cd5e81e74880051b7a20ce3b6')
