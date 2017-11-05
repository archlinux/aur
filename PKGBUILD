#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=python3-colorsysplus
pkgver=2017.11.5
pkgrel=1
pkgdesc='An extension of the standard colorsys module with support for CMYK, terminal colors, ANSI and more.'
arch=(any)
license=(GPL)
url="https://xyne.archlinux.ca/projects/python3-colorsysplus"
depends=(python3)
source=(
  https://xyne.archlinux.ca/projects/python3-colorsysplus/src/python3-colorsysplus-2017.11.5.tar.xz
  https://xyne.archlinux.ca/projects/python3-colorsysplus/src/python3-colorsysplus-2017.11.5.tar.xz.sig
)
sha512sums=(
  1bf9a519ac0d44f1d1d7375846bcb9e1a3f1c6be092147e6889994742bc4284844c5f200e423296ea8fb0008659a039784d669ce4539d1de2a9bad5c35d63e2a
  c1e6462c0adf5fc4a699ca8d6bd9d6e4b3e94e40e5ad2b8c149b198e6db27834e74d114264812031e1e786baae16921a967e8f554115e581a02f0667f553cb0e
)
md5sums=(
  4620cbf50b3b6adf9930d3f604b69378
  5f4bc07dad186153b7e0ad0af7456958
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package ()
{
  cd "$srcdir/$pkgname-$pkgver"
  python3 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
  install -Dm755 ctconv "$pkgdir/usr/bin/ctconv"
}


# vim: set ts=2 sw=2 et:
