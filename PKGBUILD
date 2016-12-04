#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=mimeo
pkgver=2016.12.4.1
pkgrel=1
pkgdesc='Open files by MIME-type or file name using regular expressions.'
arch=(any)
license=(GPL)
url="http://xyne.archlinux.ca/projects/mimeo"
depends=(file python-xdg python3)
optdepends=('MIME-types: for recognizing more MIME-types')
source=(
  http://xyne.archlinux.ca/projects/mimeo/src/mimeo-2016.12.4.1.tar.xz
  http://xyne.archlinux.ca/projects/mimeo/src/mimeo-2016.12.4.1.tar.xz.sig
)
sha512sums=(
  f862d2e608f4cea585248a57f2cea863f06e6d2a01ac6c5a40c93be5f4827f51b94ee4816ba9525b94b26c5e84a240adb3579e2d9ed2d92f0237ada2644f1752
  be16013250a70223369661171ce2b9281f4c6c1d3b10bcada76d32995fef739060d4e4f40af5c3e88bb82c2430b7bce7da98dbba5c883707f40ecc1a8a0e3a03
)
md5sums=(
  87c68cfa9f2ad78fd3432c3832b78ee2
  0e460b4c4067075398475c076b0516f6
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package ()
{
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}


# vim: set ts=2 sw=2 et:
