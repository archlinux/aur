#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=python3-colorsysplus
pkgver=2021.1
pkgrel=1
pkgdesc='An extension of the standard colorsys module with support for CMYK, terminal colors, ANSI and more.'
arch=(any)
license=(GPL)
url="https://xyne.archlinux.ca/projects/python3-colorsysplus"
depends=(python3)
source=(
  https://xyne.archlinux.ca/projects/python3-colorsysplus/src/python3-colorsysplus-2021.1.tar.xz
  https://xyne.archlinux.ca/projects/python3-colorsysplus/src/python3-colorsysplus-2021.1.tar.xz.sig
)
sha512sums=(
  d9e46701c79c85f0c83101db049ce39b0de21f99807dae5616ca525b272a05bca628cf6290a9d9899446f73b7cd13c2c75c212e9a819bf4db09dd71f283f46d2
  6e66c981d2d9540d83768f5cb4f84fff16d6ba3a73a9bcf455b13c6d966537e1e22ea37b82fae6df62c0fac41326357ef1e4dac4653ad6e03a2ceca8ae581dc6
)
md5sums=(
  be424dc1f3e1d8663fb0d6c433bb512a
  af59f9a47785c46bfe47a3617735fb1e
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package ()
{
  cd "$srcdir/$pkgname-$pkgver"
  python3 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
  install -Dm755 ctconv "$pkgdir/usr/bin/ctconv"
}


# vim: set ts=2 sw=2 et:
