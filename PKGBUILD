#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=python3-colorsysplus
pkgver=2017
pkgrel=1
pkgdesc='An extension of the standard colorsys module with support for CMYK, terminal colors, ANSI and more.'
arch=(any)
license=(GPL)
url="https://xyne.archlinux.ca/projects/python3-colorsysplus"
depends=(python3)
source=(
  https://xyne.archlinux.ca/projects/python3-colorsysplus/src/python3-colorsysplus-2017.tar.xz
  https://xyne.archlinux.ca/projects/python3-colorsysplus/src/python3-colorsysplus-2017.tar.xz.sig
)
sha512sums=(
  7e13f672efd118d03493958f4453ebbf70d4ee08e64b6cf553d7bba176e24698d0f16c2124c82a5f84860c1039b74481ffbe6057dfc5de5bd37da3f372b740cb
  cb8cf299a3535ff43be93a8f000e946e02626d14759e5af0ce00e39d935baab3a481bec0a3815aa25212394d066dca2bfd765b20ae1e7a0470317eb4965e84f8
)
md5sums=(
  15e679bc3e565d26128aba7b724b368f
  ed5ec9a79443bc98baf6fe95e35f792c
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package ()
{
  cd "$srcdir/$pkgname-$pkgver"
  python3 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
  install -Dm755 ctconv "$pkgdir/usr/bin/ctconv"
}


# vim: set ts=2 sw=2 et:
