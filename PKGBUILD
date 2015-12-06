#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=python3-xcgf
pkgver=2015
pkgrel=1
pkgdesc='Xyne'"'"'s common generic functions, for internal use.'
arch=(any)
license=(GPL)
url="http://xyne.archlinux.ca/projects/python3-xcgf"
depends=(python3)
source=(
  http://xyne.archlinux.ca/projects/python3-xcgf/src/python3-xcgf-2015.tar.xz
  http://xyne.archlinux.ca/projects/python3-xcgf/src/python3-xcgf-2015.tar.xz.sig
)
sha512sums=(
  fe53096e3f90376674a6605e759dca8157964c3e32f5cd8415da03a1bab4915454027ad22fdafa3b088781eba38d8981d379e8c93168dc7e498e80eb3f6c6c23
  b5baf711971a29617a76d8fc8ff73d0365accdad179350ef317d68aff78b3bd0adf86ca8b9e94bb40a6bffed8d3350f4990ab5d94800e1744e132484c8ca2f42
)
md5sums=(
  63b122bb707d9e59ba26bc46a72cce00
  18d89b5198b34ba9fca87db107df265b
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package ()
{
  cd "$srcdir/$pkgname-$pkgver"
  python3 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}

# vim: set ts=2 sw=2 et:
