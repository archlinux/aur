#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=python3-colorsysplus
pkgver=2015
pkgrel=1
pkgdesc='An extension of the standard colorsys module with support for CMYK, terminal colors, ANSI and more.'
arch=(any)
license=(GPL)
url="http://xyne.archlinux.ca/projects/python3-colorsysplus"
depends=(python3)
source=(
  http://xyne.archlinux.ca/projects/python3-colorsysplus/src/python3-colorsysplus-2015.tar.xz
  http://xyne.archlinux.ca/projects/python3-colorsysplus/src/python3-colorsysplus-2015.tar.xz.sig
)
sha512sums=(
  4a76da8f020a5427107351080c3e120d1ca3d9049af88d7017038a78ea948611318e8abf415ddb342b2e9940fa5cc2178ad4483d59b16507989623734a63c952
  f31abd49e75e98892ee28f58fa090aff9f190105940875ee241f028b4fcd26bdd85677e77dab9a82b837793a85f6a9ac72ade4bd7dfc35d203700e2b536e6d9d
)
md5sums=(
  c07fbb885a54f0b6ae35c176d468b871
  38e2eb2393a20167f2cfa1a553252177
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package ()
{
  cd "$srcdir/$pkgname-$pkgver"
  python3 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}


# vim: set ts=2 sw=2 et:
