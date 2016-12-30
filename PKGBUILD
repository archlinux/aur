#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=mimeo
pkgver=2016.12.30
pkgrel=1
pkgdesc='Open files by MIME-type or file name using regular expressions.'
arch=(any)
license=(GPL)
url="http://xyne.archlinux.ca/projects/mimeo"
depends=(file python-xdg python3)
optdepends=('MIME-types: for recognizing more MIME-types')
source=(
  http://xyne.archlinux.ca/projects/mimeo/src/mimeo-2016.12.30.tar.xz
  http://xyne.archlinux.ca/projects/mimeo/src/mimeo-2016.12.30.tar.xz.sig
)
sha512sums=(
  c7e3d04376aaad20b762b49150d40b79f1661d35ab749140b872efdc62e2b479503b9c111d80a20a3a9e2f7bf04a1d3351d16829abb30157b65e868ecf398a01
  18b944b034268f023ad26d2f82fee53f4cab0ea70f497a19d20ce5bfa00a16da8592d40c1699067cf9bd1d4297bff3eaeb2b43aa127ade901160415758ddca38
)
md5sums=(
  08f62f02f8dae279229d434f39422d4d
  c7d93a30f9e7743f1548e96916697f35
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package ()
{
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}


# vim: set ts=2 sw=2 et:
