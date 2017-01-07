#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=python3-colorsysplus
pkgver=2016
pkgrel=2
pkgdesc='An extension of the standard colorsys module with support for CMYK, terminal colors, ANSI and more.'
arch=(any)
license=(GPL)
url="http://xyne.archlinux.ca/projects/python3-colorsysplus"
depends=(python3)
source=(
  http://xyne.archlinux.ca/projects/python3-colorsysplus/src/python3-colorsysplus-2016.tar.xz
  http://xyne.archlinux.ca/projects/python3-colorsysplus/src/python3-colorsysplus-2016.tar.xz.sig
)
sha512sums=(
  d06268a267df8c668803336abf1144d813b1a9aa807085abe63f59a4eb178895fa0cb5ddae4ff17b324c56ce655a52b2ff93efdf6ad7a21b9d038a8b6d8554fa
  0f24436c061f84b3fa51efdcc80ff609526afb21e0ec90f9596d52bb6788d8f697b0a6c8ed87370a915446b176fa2f38c2741789e333a24a0c96d11a0c0700ac
)
md5sums=(
  f317d3dab87c1cd605570703fb71e6c4
  293d02df463d0f9e622b62845866a100
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package ()
{
  cd "$srcdir/$pkgname-$pkgver"
  python3 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
  install -Dm755 ctconv "$pkgdir/usr/bin/ctconv"
}


# vim: set ts=2 sw=2 et:
