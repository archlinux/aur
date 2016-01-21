#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=mimeo
pkgver=2016.1.21.1
pkgrel=1
pkgdesc='Open files by MIME-type or file name using regular expressions.'
arch=(any)
license=(GPL)
url="http://xyne.archlinux.ca/projects/mimeo"
depends=(file python-xdg python3)
optdepends=('MIME-types: for recognizing more MIME-types')
source=(
  http://xyne.archlinux.ca/projects/mimeo/src/mimeo-2016.1.21.1.tar.xz
  http://xyne.archlinux.ca/projects/mimeo/src/mimeo-2016.1.21.1.tar.xz.sig
)
sha512sums=(
  4ed4536fbd97d3ae3dd7a847bb4426e23f99cac670204ab71d5600a351f57238c2908cb2475f3db77ca26cdc4c7473e99dda46778ec24e010c503000149841a9
  a454b772e1bb1fe3ba5d1db05bac54c15ed4b5f4241c55bbe1d540220a6e6529ad8e0768c8238db79f1a15716f641697bc081f67891dfb903783190803f87482
)
md5sums=(
  3c0f0a0ffcc95d0bb5596669b0b17d57
  26b9b59ad2911cafd516a11eb438512f
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package ()
{
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}


# vim: set ts=2 sw=2 et:
