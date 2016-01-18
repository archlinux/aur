#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=obfilebrowser
pkgver=2016.1.18.1
pkgrel=1
pkgdesc='An Openbox pipe menu application and file browser.'
arch=(any)
license=(GPL)
url="http://xyne.archlinux.ca/projects/obfilebrowser"
depends=(mimeo python-xdg python3)
source=(
  http://xyne.archlinux.ca/projects/obfilebrowser/src/obfilebrowser-2016.1.18.1.tar.xz
  http://xyne.archlinux.ca/projects/obfilebrowser/src/obfilebrowser-2016.1.18.1.tar.xz.sig
)
sha512sums=(
  a670f9415006276828eb71f849213bfd9a1ba3f60aaccb72fae56221cad3643e90f3dd99a38b3d4795a76b2b5b6fbfc2fc8ec902630a63e6eea3577bad54a711
  ba15827f92937839c21f78f80ebf7b626bf85ce42baeafe1f1735b39df8b11281d50df6081f96662f4b1485b8660b615f632c66fe5dd353d87977e347a94d227
)
md5sums=(
  7973c27dc38f85ea093d0fca987bc38d
  5fadc8fcea73d6160db815f6ab310631
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package ()
{
  cd "$srcdir/$pkgname-$pkgver"
  python3 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}


# vim: set ts=2 sw=2 et:
