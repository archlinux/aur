#Maintainer: Xyne <gro xunilhcra enyx, backwards>
pkgname=pbget
pkgver=2021.12
pkgrel=13
pkgdesc='Retrieve PKGBUILDs and local source files from Git, ABS and the AUR for makepkg.'
arch=(any)
license=(GPL)
url="https://xyne.dev/projects/pbget"
depends=(git pm2ml python3 python3-aur python3-xcgf python3-xcpf)
source=(
  https://xyne.dev/projects/pbget/src/pbget-2021.12.tar.xz
  https://xyne.dev/projects/pbget/src/pbget-2021.12.tar.xz.sig
)
sha512sums=(
  286cf77c13caabefd24d583bb5b5b04ce2467a299507e0c64cb21f53004ab4eac8db878f48dde31e15f9ac50b761262e87c8dc7cfb9acb4b74a315f25e31cda0
  96269f75c7d11eea8ee0ca5890de7cbd2ece102269963eab1942503447d1604325ce36d5f88bb3124624b88be97bb607758ca0ffa6dde91bea51a7703f34c8e3
)
md5sums=(
  0d5bd5b5f676c34226571275a07cbad7
  a180313e00fecc8b19701b0285ea33c9
)
validpgpkeys=('D89FAAEB4CECAFD199A2F5E612C6F735F7A9A519')

package ()
{
  cd "$srcdir/$pkgname-$pkgver"
  python3 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}

# vim: set ts=2 sw=2 et:
