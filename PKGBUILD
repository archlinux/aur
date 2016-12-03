#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=mimeo
pkgver=2016.12
pkgrel=1
pkgdesc='Open files by MIME-type or file name using regular expressions.'
arch=(any)
license=(GPL)
url="http://xyne.archlinux.ca/projects/mimeo"
depends=(file python-xdg python3)
optdepends=('MIME-types: for recognizing more MIME-types')
source=(
  http://xyne.archlinux.ca/projects/mimeo/src/mimeo-2016.12.tar.xz
  http://xyne.archlinux.ca/projects/mimeo/src/mimeo-2016.12.tar.xz.sig
)
sha512sums=(
  8f5ba1349f61b69b6aab388ebea1a70660e13af7ce492d36002560fb4c1fcc6fcb793b23acd150bcea73e6538312627f028c0e89253df1d61bb0e44a44ae96d3
  a3ccb6df68d0d7250d48fa260261e70cd679c0ddbecad41a13849cf5d4f273b1bc88400b84a594eda96d50126bf19d85ae7d80cf67c43a7d3046a0b38d97f576
)
md5sums=(
  af307088600575e6acdb5d2f404f96a3
  e3e909423284996fb5fb3ecc9d5bdfc1
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package ()
{
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}


# vim: set ts=2 sw=2 et:
