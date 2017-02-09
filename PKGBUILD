#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=mimeo
pkgver=2017.2.9
pkgrel=1
pkgdesc='Open files by MIME-type or file name using regular expressions.'
arch=(any)
license=(GPL)
url="http://xyne.archlinux.ca/projects/mimeo"
depends=(file python-xdg python3)
optdepends=('MIME-types: for recognizing more MIME-types')
source=(
  http://xyne.archlinux.ca/projects/mimeo/src/mimeo-2017.2.9.tar.xz
  http://xyne.archlinux.ca/projects/mimeo/src/mimeo-2017.2.9.tar.xz.sig
)
sha512sums=(
  0e2cf07e75fbeed76bfd8574f8f4d511234bfbaff67b47f2015d585522388eac504a12edccf71438a72ec780c18d6fcfba5bad1a78d8f68dfc26934b2ccb8ff4
  a221f0e38648763aeac86a85e2c46721720bf83537ba5a757bf82a426de7d83b49935d5591855e5fda322f0cc0621d404e1fc89ad6f065b8e0a651a8096a97b7
)
md5sums=(
  8ca7b933b452785fe75be8e341f13b84
  b36d57bab918ee3dd74963f7edc07c4e
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package ()
{
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}


# vim: set ts=2 sw=2 et:
