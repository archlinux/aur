# Maintainer: Julien Nicoulaud <julien.nicoulaud@gmail.com>
# Source: https://github.com/nicoulaj/archlinux-packages
pkgname=rainbow
pkgver=2.5.0
pkgrel=1
pkgdesc="Colorize commands output or STDIN using patterns."
arch=(any)
url="https://github.com/nicoulaj/rainbow"
license=(GPL3)
depends=(python)
changelog=Changelog
provides=('rainbow-git')
conflicts=('rainbow-git')
source=("http://pypi.python.org/packages/source/r/${pkgname}/${pkgname}-${pkgver}.tar.gz")
md5sums=('0f88102768f2f3125a8a3313abcfa6ef')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1
}
