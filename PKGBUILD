# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# See http://wiki.archlinux.org/index.php/Python_Package_Guidelines for more
# information on Python packaging.

# Maintainer: Alvin Jian <alvinchien0624@gmail.com>
pkgname=python-autobgch
pkgver=0.3.1
pkgrel=1
pkgdesc="A simple and automatic wallpaper changer supporting various backends for Linux"
arch=('any')
url="https://github.com/AlvinJian/auto_background_changer"
license=('MIT')
depends=('python')
optdepends=('feh: lightweight window manager support')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/AlvinJian/auto_background_changer/archive/v${pkgver}.tar.gz")
md5sums=('4d556b0f4d4234d0fbe6a77d6f89ebe5')

package() {
  cd "$srcdir/auto_background_changer-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}
