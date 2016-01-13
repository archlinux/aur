#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=mimeo
pkgver=2016.1.13
pkgrel=1
pkgdesc='Open files by MIME-type or file name using regular expressions.'
arch=(any)
license=(GPL)
url="http://xyne.archlinux.ca/projects/mimeo"
depends=(file python-xdg python3)
optdepends=('MIME-types: for recognizing more MIME-types')
source=(
  http://xyne.archlinux.ca/projects/mimeo/src/mimeo-2016.1.13.tar.xz
  http://xyne.archlinux.ca/projects/mimeo/src/mimeo-2016.1.13.tar.xz.sig
)
sha512sums=(
  5ad4edebc7a1db5a439b03dfb21304c2f2cfac990f9853f65e4ccc00aa477c8d7c8688772b7702a2817a3aaf6822e8cc8a4b8b9e835767192f04da0f9a5e4782
  f07bbc46c91423ef02838c32ae986e18190d55918b580d9748129bcd34ac3f35405622834e55b561b7eca48e86907f26563b9a1caf6c101d803a3bd5b2aeead8
)
md5sums=(
  066bde69d00329010178377cde5d8196
  0cdbbd45ef90135c41d8ad696caecd99
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package ()
{
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}


# vim: set ts=2 sw=2 et:
