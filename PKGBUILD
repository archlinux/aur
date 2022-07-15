#Maintainer: Xyne <gro xunilhcra enyx, backwards>
pkgname=alatools
pkgver=2022.6
pkgrel=3
pkgdesc='Tools for the Arch Linux Archive.'
arch=(any)
license=(GPL)
url="https://xyne.dev/projects/alatools"
depends=(python-pyxdg python3)
source=(
  https://xyne.dev/projects/alatools/src/alatools-2022.6.tar.xz
  https://xyne.dev/projects/alatools/src/alatools-2022.6.tar.xz.sig
)
sha512sums=(
  3c05ba7269f12573007d5c1ef67a44897bcc403cee688541be1971db9d9ea342564192936a1a7c49e145a71d57fa95e8d8dc9d36e521c17aff2d10aec52261e2
  5109fa4a577fd7713fd4ef3fa1cabafa5474c8219a362c6d3dfd240d46cab17350bd9adfc0b7108a13652a2dfd4fc7868d905ca48a8107894274995075332d2c
)
md5sums=(
  bd0bfcb0173ea3b605bf508793da58b5
  6dd44c73ca1ceda1d8d45e476b5eda78
)
validpgpkeys=('D89FAAEB4CECAFD199A2F5E612C6F735F7A9A519')

package ()
{
  for script_ in "$srcdir/$pkgname-$pkgver/exe/"*
  do
    install -Dm755 "$script_" "$pkgdir/usr/bin/${script_##*/}"
  done
}


# vim: set ts=2 sw=2 et:
