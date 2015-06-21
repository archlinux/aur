#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=python3-memoizedb
pkgver=2012.12
pkgrel=4
pkgdesc='Generic data retrieval memoizer that uses an sqlite database to cache data.'
arch=(any)
license=(GPL)
url="http://xyne.archlinux.ca/projects/python3-memoizedb"
depends=(python3)
source=(
  http://xyne.archlinux.ca/projects/python3-memoizedb/src/python3-memoizedb-2012.12.tar.xz
  http://xyne.archlinux.ca/projects/python3-memoizedb/src/python3-memoizedb-2012.12.tar.xz.sig
)
sha512sums=(
  8b04119253f92b579ef49bb58118db183fde1584f192d7c3c1371564b310adb277327745ec0628f0a09ab17a18ae5e28708d0b128516655667e3a9c1eafeb5bd
  c2dbf0c71ad4471e6abc7a057d39ec3be9689ce4a01ad03f8f927b8987f99d5fb7b6d9027805b4038576200af63ca6f007fdefbd7b5bfb76a65ccf3964037d95
)
md5sums=(
  cbd300a5bd7e11130954f2b50a99d631
  868a3327f75bc7a253ee871374666126
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package ()
{
  cd "$srcdir/$pkgname-$pkgver"
  python3 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}


# vim: set ts=2 sw=2 et:
