#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=mimeo
pkgver=2019.3
pkgrel=1
pkgdesc='Open files by MIME-type or file name using regular expressions.'
arch=(any)
license=(GPL)
url="https://xyne.archlinux.ca/projects/mimeo"
depends=(file python-xdg python3)
optdepends=('shared-mime-info: for recognizing more MIME-types')
source=(
  https://xyne.archlinux.ca/projects/mimeo/src/mimeo-2019.3.tar.xz
  https://xyne.archlinux.ca/projects/mimeo/src/mimeo-2019.3.tar.xz.sig
)
sha512sums=(
  2db1754e041d7e41e7771634465cade96942fdbf931168b7735ad0d547e8278920e2986e241c31985ca969ca81209caf4a035cdcc574766a504ce4ff6d3d0d70
  1cac0081fbc9eb3c8e9c9dd7663e731605a3c1d3066ea8102dd02f0b4ca9e4d5553e7495b1ac878be592a22a956faa87da81c114ae3f0352d916ec8b140aa623
)
md5sums=(
  7559691b54bca4139aca0416c029053d
  76d9889c740be7c2d485874025cf1495
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package ()
{
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}


# vim: set ts=2 sw=2 et:
