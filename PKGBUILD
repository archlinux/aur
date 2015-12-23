#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=python3-colorsysplus
pkgver=2015.12
pkgrel=1
pkgdesc='An extension of the standard colorsys module with support for CMYK, terminal colors, ANSI and more.'
arch=(any)
license=(GPL)
url="http://xyne.archlinux.ca/projects/python3-colorsysplus"
depends=(python3)
source=(
  http://xyne.archlinux.ca/projects/python3-colorsysplus/src/python3-colorsysplus-2015.12.tar.xz
  http://xyne.archlinux.ca/projects/python3-colorsysplus/src/python3-colorsysplus-2015.12.tar.xz.sig
)
sha512sums=(
  7345901cb8391a3d4a759cc67c0d732a3787948c8aef01a86dca21376b6278137346087d412ee6a9a165b1a0be3ba4fd7a2ccd046a3282785c60fb1e89a04493
  caf43d917b959b54219bf8f3df4ebb6d274e40b6be08e59e474afcd23230072c9e9c10debecdbf852810a23ffbd8e329bba05f4d4ccec00ba1fc795b18f8998b
)
md5sums=(
  c89fedad9b8c2821acf9c2a9787b6cb3
  a1f180b855402f5f3fa3b3bee9560983
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package ()
{
  cd "$srcdir/$pkgname-$pkgver"
  python3 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
  install -Dm755 ctconv "$pkgdir/usr/bin/ctconv"
}


# vim: set ts=2 sw=2 et:
