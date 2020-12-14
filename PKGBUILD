#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=rmdupes
pkgver=2020.12
pkgrel=1
pkgdesc='Command-line tool to find and remove duplicate files.'
arch=(any)
license=(GPL)
url="https://xyne.archlinux.ca/projects/rmdupes"
depends=(python3)
source=(
  https://xyne.archlinux.ca/projects/rmdupes/src/rmdupes-2020.12.tar.xz
  https://xyne.archlinux.ca/projects/rmdupes/src/rmdupes-2020.12.tar.xz.sig
)
sha512sums=(
  08c8a67f3be0d759427744184dee7ab231960280f39ef883c0f62c01021a0feff4cc9f1d9a1e4707e0ea6d314d72551a0e45b86c8b1239325379f6f7c56caaaf
  cf7f5195f5eabec1fc1c0f3c9aaa24692caf6089c6aeb17301628c973fd618f818bc1a26d23d7a9137ef15bcfca105e8db478a5df169467602698a6436a443e4
)
md5sums=(
  eca5f5451f4ca6c96ef1cfde76f1f789
  ff891e74fecce3b060a47b8489b5663e
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package ()
{
  install -Dm755 "$srcdir/$pkgname-$pkgver/$pkgname" "$pkgdir/usr/bin/$pkgname"
}


# vim: set ts=2 sw=2 et:
