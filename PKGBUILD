#Maintainer: Xyne <gro xunilhcra enyx, backwards>
pkgname=repo-add_and_sign
pkgver=2021.11.12
pkgrel=4
pkgdesc='Easily create signed Pacman package repositories.'
arch=(any)
license=(GPL)
url="https://xyne.dev/projects/repo-add_and_sign"
depends=(pyalpm python3 python3-gpg_batch_sign)
source=(
  https://xyne.dev/projects/repo-add_and_sign/src/repo-add_and_sign-2021.11.12.tar.xz
  https://xyne.dev/projects/repo-add_and_sign/src/repo-add_and_sign-2021.11.12.tar.xz.sig
)
sha512sums=(
  f2d9b9e6158fb30dc1b48911ae181483f9b3d4aeef26eea047cbc7ccb4cf8f670e817a3908ac905da20345a7b599089d6f10a4fabaa8043186d665d77afecf27
  99b3b7911a7ea0678098d920e9a93837417e1a4fab2d82e2e4e9bc2b5146c5af2df826fb62078c6ac290c96c70e9e80212725fe37dab3d1b19fcd1c9739626b6
)
md5sums=(
  e8ed6f559071ef28beedc1a7ebfd65e5
  81598c9a05fa503576c83e056bd84358
)
validpgpkeys=('D89FAAEB4CECAFD199A2F5E612C6F735F7A9A519')

package ()
{
  install -Dm755 "$srcdir/$pkgname-$pkgver/$pkgname" "$pkgdir/usr/bin/$pkgname"
}


# vim: set ts=2 sw=2 et:
