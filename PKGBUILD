#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=python3-colorsysplus
pkgver=2020.4.27.4
pkgrel=1
pkgdesc='An extension of the standard colorsys module with support for CMYK, terminal colors, ANSI and more.'
arch=(any)
license=(GPL)
url="https://xyne.archlinux.ca/projects/python3-colorsysplus"
depends=(python3)
source=(
  https://xyne.archlinux.ca/projects/python3-colorsysplus/src/python3-colorsysplus-2020.4.27.4.tar.xz
  https://xyne.archlinux.ca/projects/python3-colorsysplus/src/python3-colorsysplus-2020.4.27.4.tar.xz.sig
)
sha512sums=(
  bc71603f71c158aa83cb9273eaef019d57be19b4279f6261c7ec94585b04c8445e423e9ce44f641bae360f1415fd1eebe4afc180458eb82d52f6c9b32814dc35
  d78e3f8e75f33fd82534fe61493fa47312c8a0e1ed0b1349b9ae7c1bec9cb27fe84687d4d979880041803062dbbccac6140793b47275fb0fe84548e9859b0b7e
)
md5sums=(
  c46a904bf7a617369a155c0a23e627bb
  9471c72c6176a7c9d5880850fecbe18a
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package ()
{
  cd "$srcdir/$pkgname-$pkgver"
  python3 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
  install -Dm755 ctconv "$pkgdir/usr/bin/ctconv"
}


# vim: set ts=2 sw=2 et:
