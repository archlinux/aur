#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=mimeo
pkgver=2017.5
pkgrel=1
pkgdesc='Open files by MIME-type or file name using regular expressions.'
arch=(any)
license=(GPL)
url="http://xyne.archlinux.ca/projects/mimeo"
depends=(file python-xdg python3)
optdepends=('MIME-types: for recognizing more MIME-types')
source=(
  http://xyne.archlinux.ca/projects/mimeo/src/mimeo-2017.5.tar.xz
  http://xyne.archlinux.ca/projects/mimeo/src/mimeo-2017.5.tar.xz.sig
)
sha512sums=(
  4a12a1482586ef002bd7a47b04aad027853f6f39cd3078edee75c47817aa7a2b42347c675e0090d2e335e924222bb371a3a54c36cb2f478ee10b912ae422634d
  a48a95cfbe6a8578b8efa4445e21f503a06d24868e0c77ddfcc2a8a9d269739a1ceb7195db909f97d8b3216273267851cf39d2527a7b5778dd76a873b60d9d36
)
md5sums=(
  3b62fc88d6d841e541c997e781268d8e
  e876968ef791364726b8d6d8bee9aa5e
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package ()
{
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}


# vim: set ts=2 sw=2 et:
