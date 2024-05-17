#Maintainer: Xyne <gro xunilhcra enyx, backwards>
pkgname=mimeo
pkgver=2023
pkgrel=13
pkgdesc='Open files by MIME-type or file name using regular expressions.'
arch=(any)
license=(GPL)
url="https://xyne.dev/projects/mimeo"
depends=(file python-pyxdg python3)
makedepends=(python-setuptools)
optdepends=('shared-mime-info: for recognizing more MIME-types')
source=(
  https://xyne.dev/projects/mimeo/src/mimeo-2023.tar.xz
  https://xyne.dev/projects/mimeo/src/mimeo-2023.tar.xz.sig
)
sha512sums=(
  700c0cc79ee4a37aceeaddf1370112b65ea7506f6740c3be7339d53787d419046f3086304bd4f97a13c11e81d0bc0973cd3542ef70ab888f4f6c01808bb00d30
  373d57b2c0d99f86ab2dfb9640f945a9481a426a7d77368720c6bcd133708fb0893aa15b27be3d621cbdfd84f540bd4c78389dcb4ac50e61f01cec830f94c061
)
md5sums=(
  9f35a1902912b9cd0bd9b6ab5a667c2f
  5a8e3ec4de4470d287f39c0a8ed545af
)
validpgpkeys=('D89FAAEB4CECAFD199A2F5E612C6F735F7A9A519')

package ()
{
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}


# vim: set ts=2 sw=2 et:
