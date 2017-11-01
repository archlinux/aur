#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=python3-colorsysplus
pkgver=2017.11.1.2
pkgrel=1
pkgdesc='An extension of the standard colorsys module with support for CMYK, terminal colors, ANSI and more.'
arch=(any)
license=(GPL)
url="https://xyne.archlinux.ca/projects/python3-colorsysplus"
depends=(python3)
source=(
  https://xyne.archlinux.ca/projects/python3-colorsysplus/src/python3-colorsysplus-2017.11.1.2.tar.xz
  https://xyne.archlinux.ca/projects/python3-colorsysplus/src/python3-colorsysplus-2017.11.1.2.tar.xz.sig
)
sha512sums=(
  e2e959ec0774c8f19ea223fd6805bbb82383aeb64e6a2457d575adcc06903f26492112ec7d6144dc5699f8b31d153d59f2cacc90a70694b5b36ce389adf55353
  3fba17942bcecca822a9cea458efb8b71e63be9541a83b5f0e60bcf12e37bee16b7588ec2ea0bb9087d61ab513e675e29c4d0e32c0617c13c82a6a242b6042bc
)
md5sums=(
  1ad5b879a9664fa833c383c61dece618
  659a7c3a4d22b39abdbafcf8d1adc7a3
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package ()
{
  cd "$srcdir/$pkgname-$pkgver"
  python3 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
  install -Dm755 ctconv "$pkgdir/usr/bin/ctconv"
}


# vim: set ts=2 sw=2 et:
