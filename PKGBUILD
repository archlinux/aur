#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=svgtools
pkgver=2016
pkgrel=1
pkgdesc='Tools for working with SVG files and JessyInk presentations.'
arch=(any)
license=(GPL)
url="http://xyne.archlinux.ca/projects/svgtools"
depends=(python3)
optdepends=('inkscape: jessy_to_slides support' 'phantomjs: jessy_to_slides support')
source=(
  http://xyne.archlinux.ca/projects/svgtools/src/svgtools-2016.tar.xz
  http://xyne.archlinux.ca/projects/svgtools/src/svgtools-2016.tar.xz.sig
)
sha512sums=(
  c571ddc878d5f14fbcb0e3b022b7ee3519c31fbba54f5cd2510b4aad97405d8248b002d18b33112e251547636007c37b78d5176f1d473b9474e05d4916aef554
  6d600fbf5dee2e272f1446018e7ea78feb40b97bb275cdf2dc21849ba32527cb88a10b2abaca6e544f7c7ffc8deac93f08d7a14c6cd3dbb2abad11f27fc67385
)
md5sums=(
  d55637792a868b60fd58190a4e4d8914
  fe6aabde9fa22e63b5433023350fea7e
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package ()
{
  cd "$srcdir/$pkgname-$pkgver"
  for script_ in scripts/*
  do
    install -Dm755 "$script_" "$pkgdir/usr/bin/${script_##*/}"
  done
}


# vim: set ts=2 sw=2 et:
