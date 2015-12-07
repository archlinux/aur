#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=python3-xcgf
pkgver=2015.12.7
pkgrel=1
pkgdesc='Xyne'"'"'s common generic functions, for internal use.'
arch=(any)
license=(GPL)
url="http://xyne.archlinux.ca/projects/python3-xcgf"
depends=(python3)
source=(
  http://xyne.archlinux.ca/projects/python3-xcgf/src/python3-xcgf-2015.12.7.tar.xz
  http://xyne.archlinux.ca/projects/python3-xcgf/src/python3-xcgf-2015.12.7.tar.xz.sig
)
sha512sums=(
  72a2aa3de93520958da59cfcbeb69f397e02885a23dbe2c8f68e1cac0fe68f8acbcebef17176dd4a182f047f7727ac10d40b8ae1dd9c404fb95c98add152f94e
  c696f11ab532d6c20da3a6f85d426c6e1bf83c5af6ce9451c80fc4467e25f449d5aa323f15601d762339d477a5c23a56d778244cb7ae1b2751d9434fed4e5354
)
md5sums=(
  7c923cb6192bd9e77903d1d01431e523
  04bc5e6d83ef4b229bf48f3353def7f4
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package ()
{
  cd "$srcdir/$pkgname-$pkgver"
  python3 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}

# vim: set ts=2 sw=2 et:
