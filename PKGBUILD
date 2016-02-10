#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=mimeo
pkgver=2016.2
pkgrel=1
pkgdesc='Open files by MIME-type or file name using regular expressions.'
arch=(any)
license=(GPL)
url="http://xyne.archlinux.ca/projects/mimeo"
depends=(file python-xdg python3)
optdepends=('MIME-types: for recognizing more MIME-types')
source=(
  http://xyne.archlinux.ca/projects/mimeo/src/mimeo-2016.2.tar.xz
  http://xyne.archlinux.ca/projects/mimeo/src/mimeo-2016.2.tar.xz.sig
)
sha512sums=(
  5d140a78e4504d0b1338e8558507c47b664e1ea2d59742c7fca3f6f8f779b59a714497dd4a44bba62896d9146170fa5b2102bef17801b48ff33f336bea346d92
  0d6e8d4f6a1bc6434052e288dae85e2220b32470cee576087afa1bafd9c1108c9aae35bd92941a181c5d88120ba97381de36f5f4f6f5c5312b2704f298ca9968
)
md5sums=(
  4284e630c9102bae167b88335f944174
  6a0b116ce9a046bf6ef6063350ef6ace
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package ()
{
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}


# vim: set ts=2 sw=2 et:
