#Maintainer: Xyne <gro xunilhcra enyx, backwards>
pkgname=mimeo
pkgver=2022.7
pkgrel=3
pkgdesc='Open files by MIME-type or file name using regular expressions.'
arch=(any)
license=(GPL)
url="https://xyne.dev/projects/mimeo"
depends=(file python-pyxdg python3)
optdepends=('shared-mime-info: for recognizing more MIME-types')
source=(
  https://xyne.dev/projects/mimeo/src/mimeo-2022.7.tar.xz
  https://xyne.dev/projects/mimeo/src/mimeo-2022.7.tar.xz.sig
)
sha512sums=(
  540eeee349205156d800d12d4de532d50a08d8ee43cb27ff31a6e63a45b552c7594eab07f9a30b4bf8c09bf0596800df60ca1f663d455ce5aee49aa57f8ea0e4
  21ae130e849f4a72e06fed415c948988b67eecba79a38f8fd9d52e2739b51e81870a28af934fcb66b24f1ae003b4b78993409f77787a0675885e265156a34f13
)
md5sums=(
  bc08729fabe44d9de9e065df74baa041
  1e56ff89ca07027b2c76fe354f294b3b
)
validpgpkeys=('D89FAAEB4CECAFD199A2F5E612C6F735F7A9A519')

package ()
{
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}


# vim: set ts=2 sw=2 et:
