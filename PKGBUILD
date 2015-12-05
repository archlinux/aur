#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=python3-memoizedb
pkgver=2015
pkgrel=1
pkgdesc='Generic data retrieval memoizer that uses an sqlite database to cache data.'
arch=(any)
license=(GPL)
url="http://xyne.archlinux.ca/projects/python3-memoizedb"
depends=(python3)
source=(
  http://xyne.archlinux.ca/projects/python3-memoizedb/src/python3-memoizedb-2015.tar.xz
  http://xyne.archlinux.ca/projects/python3-memoizedb/src/python3-memoizedb-2015.tar.xz.sig
)
sha512sums=(
  b032152aea48f216c20fd0161db800ac97e1f0801b192adfd6113b6c24e9f19f29207aee32b6da30b039fadfe49867c6f65f4eb338758133635f4ba8ccf7a98f
  2fc897acd05312ddd8d6e1eb24611eb46a43c237c0d9b85b52823d2cedb23e4669ec9fa3aef0e9cbd081d6d6e85d5404c6f6c176ae1845f71691948cbf7baa9c
)
md5sums=(
  75f1ba35bb429471ae8ce0fe7ee8f204
  6f03b7b63b72d3ce034c45f7c13e1e02
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package ()
{
  cd "$srcdir/$pkgname-$pkgver"
  python3 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}


# vim: set ts=2 sw=2 et:
