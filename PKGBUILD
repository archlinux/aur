#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=python3-memoizedb
pkgver=2016.4.24.1
pkgrel=1
pkgdesc='Generic data retrieval memoizer that uses an sqlite database to cache data.'
arch=(any)
license=(GPL)
url="http://xyne.archlinux.ca/projects/python3-memoizedb"
depends=(python3)
source=(
  http://xyne.archlinux.ca/projects/python3-memoizedb/src/python3-memoizedb-2016.4.24.1.tar.xz
  http://xyne.archlinux.ca/projects/python3-memoizedb/src/python3-memoizedb-2016.4.24.1.tar.xz.sig
)
sha512sums=(
  9f145cfbbf020ab7a2ee3aad525d4d8c294a0face0a2e698e52341487d26bfd3af1cd7ca49c35071c2fdbfc5972ece146827c4d2a8da5daa8826c7cf0f2a6ff6
  f13038fce2bfdbe68aa1baa385ab1433cf594dd9f883b3d32ba3c2805978ae659ee54efe5f67bb2c15c855798bbc62f91c822a91352ac0f583c303776f4b8186
)
md5sums=(
  5d604e8f170df940ef4381c83a8b9868
  51d7be95192289b086ab9b7fad36e381
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package ()
{
  cd "$srcdir/$pkgname-$pkgver"
  python3 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}


# vim: set ts=2 sw=2 et:
