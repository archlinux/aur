#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=python3-colorsysplus
pkgver=2013
pkgrel=4
pkgdesc='An extension of the standard colorsys module with support for CMYK, terminal colors, ANSI and more.'
arch=(any)
license=(GPL)
url="http://xyne.archlinux.ca/projects/python3-colorsysplus"
depends=(python3)
source=(
  http://xyne.archlinux.ca/projects/python3-colorsysplus/src/python3-colorsysplus-2013.tar.xz
  http://xyne.archlinux.ca/projects/python3-colorsysplus/src/python3-colorsysplus-2013.tar.xz.sig
)
sha512sums=(
  c60c27cf89c183e1d71180e2dd5d86d410f980298e107358d305c62ae7d33f619e832e9d049ed6d8be5fb6c1cac844184fc799fa0c137785ac42492068c8d4a8
  35c3babd7e22e36bbee08e968675fe82eb9c3649ca7b927d2a006668f624d9bf122cb7e24252d696f3f8ff40bd86da5ba8ba876bac719329af1d68de7f1c967d
)
md5sums=(
  cc47d947474ef4dc66f9dc495b93faa4
  f001bcac63069a50b0e5cd6f59ca5f89
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package ()
{
  cd "$srcdir/$pkgname-$pkgver"
  python3 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}


# vim: set ts=2 sw=2 et:
