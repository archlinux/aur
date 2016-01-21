#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=mimeo
pkgver=2016.1.21
pkgrel=1
pkgdesc='Open files by MIME-type or file name using regular expressions.'
arch=(any)
license=(GPL)
url="http://xyne.archlinux.ca/projects/mimeo"
depends=(file python-xdg python3)
optdepends=('MIME-types: for recognizing more MIME-types')
source=(
  http://xyne.archlinux.ca/projects/mimeo/src/mimeo-2016.1.21.tar.xz
  http://xyne.archlinux.ca/projects/mimeo/src/mimeo-2016.1.21.tar.xz.sig
)
sha512sums=(
  0ccc50e70d24ef2f0c2729e47acaac77c090293c0799b891714e9bf9b97655f728ca9341cc047b51f21512e0d283f55542bc6a52e89b48fe33bc888712be2d0a
  cb64e41b63062f94e016cadfb0094abe546c72b535a49473702b069552f0be4eff1df63c6c8dffd44a506f4a91b2c5474a7b2a756bb1e4297adde8a04ba89419
)
md5sums=(
  1ea5d2df5df1542442e9ee7a1389f386
  0c58dc263a4ff56f754f170612970a0d
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package ()
{
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}


# vim: set ts=2 sw=2 et:
