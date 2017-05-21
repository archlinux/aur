# Maintainer: Henri Chain <henri@henri-chain.com>
pkgname=python-pulseaudio
pkgver=9.0
pkgrel=1
pkgdesc="Python bindings for pulseaudio"
arch=('any')
url="https://github.com/thelinuxdude/${pkgname}"
depends=('python' "pulseaudio>=$pkgver")
license=('MIT')
source=("${pkgname}::git+https://github.com/thelinuxdude/${pkgname}.git#branch=pa-${pkgver}")
md5sums=('SKIP')

package() {
  cd "${srcdir}/${pkgname}/"
  python2 setup.py install --root="$pkgdir"
}

