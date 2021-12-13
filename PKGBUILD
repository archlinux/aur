#Maintainer: Xyne <gro xunilhcra enyx, backwards>
pkgname=python3-xynexdg
pkgver=2021
pkgrel=2
pkgdesc='Implementation of various freedesktop.org standards, for internal use in Xyne'"'"'s modules.'
arch=(any)
license=(GPL)
url="https://xyne.dev/projects/python3-xynexdg"
depends=(python3)
source=(
  https://xyne.dev/projects/python3-xynexdg/src/python3-xynexdg-2021.tar.xz
  https://xyne.dev/projects/python3-xynexdg/src/python3-xynexdg-2021.tar.xz.sig
)
sha512sums=(
  68362460ef36164b3e17d294269ecea51ff5a477a1e4f0d6c8eaca29a1bacdb5d2ee733ca0a68c0159774c4354eb968bbcc3a1b2be62b4b7eafd60c09802de67
  3410d3db7522f9a5d465ee399c635f1fe02348d0249b957b703ccac9e057b15f04f21c0f2d575ab891f40d41a1fdc5529e7713e4aa0cdac512a04ccf878dd189
)
md5sums=(
  10784cb444bcf29db1a29e386eb67ef0
  b7d1c655aa82759529e8540c375a7d12
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package ()
{
  cd "$srcdir/$pkgname-$pkgver"
  python3 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}


# vim: set ts=2 sw=2 et:
