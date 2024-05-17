#Maintainer: Xyne <gro xunilhcra enyx, backwards>
pkgname=xac
pkgver=2021
pkgrel=15
pkgdesc='A markdown- and Pandoc-based content management system (CMS).'
arch=(any)
license=(GPL)
url="https://xyne.dev/projects/xac"
depends=(pandoc python3)
makedepends=(python-setuptools)
optdepends=('graphviz: plugin support' 'openbabel: plugin support' 'source-highlight: plugin support' 'tex2png: plugin support')
source=(
  https://xyne.dev/projects/xac/src/xac-2021.tar.xz
  https://xyne.dev/projects/xac/src/xac-2021.tar.xz.sig
)
sha512sums=(
  34130a8a6af68ed20750c5cf161b88cd2b9389c1a258166f02c321b6c332c4a7e97609c8e0bae54e7bc18e6a75d0be84451259a63eed7e3a3e5dce83be272cd3
  14db062d744d2c8cc2e090310cdf69ee34ebca3d33e51b704b3a7560a23572f9292f79ff47fa8ee3fe0efc00413b6eaeb0e7c5978425d7f2b372590b2ba105f2
)
md5sums=(
  53d1c1380c1b264eaadb7916b5864374
  1746607ffe5ccc158d773e8fd7ce2ecd
)
validpgpkeys=('D89FAAEB4CECAFD199A2F5E612C6F735F7A9A519')

package ()
{
  cd "$srcdir/$pkgname-$pkgver"
  python3 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}


# vim: set ts=2 sw=2 et:
