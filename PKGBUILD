#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=python3-tabulator
pkgver=2015
pkgrel=1
pkgdesc='A table formatter class with support for a variety of outputs.'
arch=(any)
license=(GPL)
url="http://xyne.archlinux.ca/projects/python3-tabulator"
depends=(python3)
source=(
  http://xyne.archlinux.ca/projects/python3-tabulator/src/python3-tabulator-2015.tar.xz
  http://xyne.archlinux.ca/projects/python3-tabulator/src/python3-tabulator-2015.tar.xz.sig
)
sha512sums=(
  6905872b85a4e5acaf0243d58995cd028e75c20ca0f0db2061c3c42c423be51b328f1bc9596e32e2eaa6942ad7d0f46fa787c6809aeca2b7466291a9b4f00669
  359c4f6b930b46e749e3ce908e7ccd606da9717c8add61f4f6340dd34487c6a15e02bed728e040bf90bd4b3a72fe452d9b60b4d6970a23924e6929130dc68641
)
md5sums=(
  6e8087b3bd41d45b26da0e29a953fd2a
  0762ba4a266e5f7663ab8d4aea25600d
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package ()
{
  cd "$srcdir/$pkgname-$pkgver"
  python3 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}


# vim: set ts=2 sw=2 et:
