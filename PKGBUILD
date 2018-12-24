#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=mimeo
pkgver=2018.12
pkgrel=1
pkgdesc='Open files by MIME-type or file name using regular expressions.'
arch=(any)
license=(GPL)
url="https://xyne.archlinux.ca/projects/mimeo"
depends=(file python-xdg python3)
optdepends=('MIME-types: for recognizing more MIME-types')
source=(
  https://xyne.archlinux.ca/projects/mimeo/src/mimeo-2018.12.tar.xz
  https://xyne.archlinux.ca/projects/mimeo/src/mimeo-2018.12.tar.xz.sig
)
sha512sums=(
  8a64553f72b58c9921b5f620ccb32fb014c8f6fb25b823eb2ad80e52c7c855b5f666650fae1ddc1b0a8f6124866fbbe73fbc74e6794783586dfa831e4a98f236
  5b4024bbb534d1676ee633b63ce163cbc9ae411f4238cff083a87e1a7b1d16436eb1fbcde4f48b05d827eda2f61489edd3406d2818962ba0619a5504ca44443c
)
md5sums=(
  f867910d867885f7abbef5d1078e7129
  9f2aebdc4264e825aeaf685aeae96fbf
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package ()
{
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}


# vim: set ts=2 sw=2 et:
