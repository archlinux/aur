#Maintainer: Xyne <gro xunilhcra enyx, backwards>
pkgname=python3-colorsysplus
pkgver=2025.1
pkgrel=1
pkgdesc='An extension of the standard colorsys module with support for CMYK, terminal colors, ANSI and more.'
arch=(any)
license=(GPL)
url="https://xyne.dev/projects/python3-colorsysplus"
depends=(python3)
makedepends=(python-setuptools)
source=(
  https://xyne.dev/projects/python3-colorsysplus/src/python3-colorsysplus-2025.1.tar.xz
  https://xyne.dev/projects/python3-colorsysplus/src/python3-colorsysplus-2025.1.tar.xz.sig
)
sha512sums=(
  1dca882ba2ab586f5fe90cf121d9f8a1ddb2664cfa298b3ca1679ef3f332148cb3630cad1569359f1e224e3ddd4345e96ef61bf7f495a7a2dfef19f77d8bc260
  31268ab71659ac9b8c397fb3f9bd92d068662e4b7a8235137779a85908bc93292be934fa9d07e54c32d4242b9725b1c776cec9784ed1d11a7d263e5dc396ce5f
)
md5sums=(
  97810833f24826434a20025a3eaa3358
  26b60b017b6bd33a6fb41e2928d74ca4
)
validpgpkeys=('D89FAAEB4CECAFD199A2F5E612C6F735F7A9A519')

package ()
{
  cd "$srcdir/$pkgname-$pkgver"
  python3 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
  install -Dm755 ctconv "$pkgdir/usr/bin/ctconv"
}


# vim: set ts=2 sw=2 et:
