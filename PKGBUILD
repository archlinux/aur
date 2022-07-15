#Maintainer: Xyne <gro xunilhcra enyx, backwards>
pkgname=rmdupes
pkgver=2022
pkgrel=3
pkgdesc='Command-line tool to find and remove duplicate files.'
arch=(any)
license=(GPL)
url="https://xyne.dev/projects/rmdupes"
depends=(python3)
source=(
  https://xyne.dev/projects/rmdupes/src/rmdupes-2022.tar.xz
  https://xyne.dev/projects/rmdupes/src/rmdupes-2022.tar.xz.sig
)
sha512sums=(
  ac8471871dc9e86464d26b5cbb0c19d9e4829624ced07df07fe7448b92ef8fb81db9de95b9ee1bb95aea1f0713e5e48aa3522e4578c002cf80373b56d2deacdc
  452bdde161b9d1f6d05e183e998e184b7d59f6fd1f9cd3ea3cc83463ad4e10c2a3ddc80d49377ea21b12b4649bd0be31e2bdbc7b656add0b59ce1bde92b84dff
)
md5sums=(
  9b0ea46cfa9a7a7f7e55b2eaea3fdf70
  ec0e3c724a94c0be6bfb52088af05ece
)
validpgpkeys=('D89FAAEB4CECAFD199A2F5E612C6F735F7A9A519')

package ()
{
  install -Dm755 "$srcdir/$pkgname-$pkgver/$pkgname" "$pkgdir/usr/bin/$pkgname"
}


# vim: set ts=2 sw=2 et:
