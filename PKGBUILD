#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=mimeo
pkgver=2017.2
pkgrel=1
pkgdesc='Open files by MIME-type or file name using regular expressions.'
arch=(any)
license=(GPL)
url="http://xyne.archlinux.ca/projects/mimeo"
depends=(file python-xdg python3)
optdepends=('MIME-types: for recognizing more MIME-types')
source=(
  http://xyne.archlinux.ca/projects/mimeo/src/mimeo-2017.2.tar.xz
  http://xyne.archlinux.ca/projects/mimeo/src/mimeo-2017.2.tar.xz.sig
)
sha512sums=(
  8eca58d45008c61862b18216f502c7d691ac6de7344c64bd9b31267bab800665337f9139094061cc2056f81f4c5296fc79495e2be6930dcc48e8af1f554d8a33
  acc7ae88c085a841f47f9380a52f42f3dabb61f75c8b0251716ade561bf2266d907eb45086c8b00ff8b906b74ca4859504f715fef14bc46639a97288a64ddc50
)
md5sums=(
  711e288d77508082c5244f399e5cb3cd
  38688adf16f839ffff8c686bebcb7b10
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package ()
{
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}


# vim: set ts=2 sw=2 et:
