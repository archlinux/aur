#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=mimeo
pkgver=2016.1.25
pkgrel=1
pkgdesc='Open files by MIME-type or file name using regular expressions.'
arch=(any)
license=(GPL)
url="http://xyne.archlinux.ca/projects/mimeo"
depends=(file python-xdg python3)
optdepends=('MIME-types: for recognizing more MIME-types')
source=(
  http://xyne.archlinux.ca/projects/mimeo/src/mimeo-2016.1.25.tar.xz
  http://xyne.archlinux.ca/projects/mimeo/src/mimeo-2016.1.25.tar.xz.sig
)
sha512sums=(
  f05c1f96b66a4914d9f2aa1b732b959343f6678ea29a991d9ba19796a6e3b6275bb5bc81fff3f7ef2726fa045e13f68b154c92f984bf3d89c6ab3751412b6106
  209b993d59d0d492726d2d5169e195b2471b088e410a2dccc7213225940f683296bcd0c0d91e1fcc2772d978ba80ed7917033965ac6a61d9ef130c9eacbc6bdd
)
md5sums=(
  f4bb137208454be1a5bb179e31624c3e
  2b03e350b8e13ddb359ab0372e4e398d
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package ()
{
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}


# vim: set ts=2 sw=2 et:
