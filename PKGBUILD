#Maintainer: Xyne <gro xunilhcra enyx, backwards>
pkgname=python3-xynexdg
pkgver=2021
pkgrel=15
pkgdesc='Implementation of various freedesktop.org standards, for internal use in Xyne'"'"'s modules.'
arch=(any)
license=(GPL)
url="https://xyne.dev/projects/python3-xynexdg"
depends=(python3)
makedepends=(python-setuptools)
source=(
  https://xyne.dev/projects/python3-xynexdg/src/python3-xynexdg-2021.tar.xz
  https://xyne.dev/projects/python3-xynexdg/src/python3-xynexdg-2021.tar.xz.sig
)
sha512sums=(
  68362460ef36164b3e17d294269ecea51ff5a477a1e4f0d6c8eaca29a1bacdb5d2ee733ca0a68c0159774c4354eb968bbcc3a1b2be62b4b7eafd60c09802de67
  16748c9bf9883a69483bebbba870754208e47344f56f4a30ab610dc422e0c6e2bc2b64e54886105797bce18d6e71d261ce534f294a8c30ef16b5db22f19c364a
)
md5sums=(
  10784cb444bcf29db1a29e386eb67ef0
  98643ea2db70b127479ffe0eb78fea56
)
validpgpkeys=('D89FAAEB4CECAFD199A2F5E612C6F735F7A9A519')

package ()
{
  cd "$srcdir/$pkgname-$pkgver"
  python3 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}


# vim: set ts=2 sw=2 et:
