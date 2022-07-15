#Maintainer: Xyne <gro xunilhcra enyx, backwards>
pkgname=pacnew_scripts
pkgver=2012.12
pkgrel=5
pkgdesc='A collection of scripts to help merge changes in .pacnew files.'
arch=(any)
license=(GPL)
url="https://xyne.dev/projects/pacnew_scripts"
depends=(perl)
source=(
  https://xyne.dev/projects/pacnew_scripts/src/pacnew_scripts-2012.12.tar.xz
  https://xyne.dev/projects/pacnew_scripts/src/pacnew_scripts-2012.12.tar.xz.sig
)
sha512sums=(
  5bc4b63ded01da212297343a023c5fd00264246e0cfaa48b9529a8dbac7f54e354248b3d7c8cd6be08a02161a220cd6287a3e94e3385c16edf2b3326623266f1
  cb5735f6b180f15793bd0514d2ba90c7792bb70102e68de49e0f702accc90e0a9cda4be382babdb79195e53846ab040249bad96ac9cf8ed29262cbce48ce4600
)
md5sums=(
  420f3b13f46810f223b82ebcf834b94a
  5e911a5361ab1bd1ad30512b04a8a8f1
)
validpgpkeys=('D89FAAEB4CECAFD199A2F5E612C6F735F7A9A519')

package ()
{
  for _script in "$srcdir/$pkgname-$pkgver/merge_pacnew_"*
  do
    install -Dm755 "$_script" "$pkgdir"/usr/bin/"${_script##*/}"
  done
}


# vim: set ts=2 sw=2 et:
