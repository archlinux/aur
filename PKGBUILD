#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=python3-colorsysplus
pkgver=2020.4.27.3
pkgrel=1
pkgdesc='An extension of the standard colorsys module with support for CMYK, terminal colors, ANSI and more.'
arch=(any)
license=(GPL)
url="https://xyne.archlinux.ca/projects/python3-colorsysplus"
depends=(python3)
source=(
  https://xyne.archlinux.ca/projects/python3-colorsysplus/src/python3-colorsysplus-2020.4.27.3.tar.xz
  https://xyne.archlinux.ca/projects/python3-colorsysplus/src/python3-colorsysplus-2020.4.27.3.tar.xz.sig
)
sha512sums=(
  ef45a723f34b204b75a9951f540c44485213758236ebd4961c56d001d0b40708e7bc7343bcfa24e421e961cbf86e83b46571114d118ae7013b0e56e6b8f1009c
  7de5a0b4721b9224c60d8330f6eacc1b65f1a5c9d9424304caf9293c3862ec6191249c820c5cb76869da49cb11a3ed3ceb5699c319cca57ad0763d96fe1b0c06
)
md5sums=(
  7b7496b3df7fd287cf6db1eb79315df1
  5600336e7b84f3e6878fb7103f290b5e
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package ()
{
  cd "$srcdir/$pkgname-$pkgver"
  python3 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
  install -Dm755 ctconv "$pkgdir/usr/bin/ctconv"
}


# vim: set ts=2 sw=2 et:
