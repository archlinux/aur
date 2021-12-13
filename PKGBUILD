#Maintainer: Xyne <gro xunilhcra enyx, backwards>
pkgname=xac
pkgver=2021
pkgrel=2
pkgdesc='A markdown- and Pandoc-based content management system (CMS).'
arch=(any)
license=(GPL)
url="https://xyne.dev/projects/xac"
depends=(pandoc python3)
optdepends=('graphviz: plugin support' 'openbabel: plugin support' 'source-highlight: plugin support' 'tex2png: plugin support')
source=(
  https://xyne.dev/projects/xac/src/xac-2021.tar.xz
  https://xyne.dev/projects/xac/src/xac-2021.tar.xz.sig
)
sha512sums=(
  34130a8a6af68ed20750c5cf161b88cd2b9389c1a258166f02c321b6c332c4a7e97609c8e0bae54e7bc18e6a75d0be84451259a63eed7e3a3e5dce83be272cd3
  0a6e9cd71bafbac85b99012a6d49b1ed2289475fe5c0af94263644499165a3084e6bfafa9f7b1829d63c69be7a92ed904b8b77d15167716af8979ccd17e70a0a
)
md5sums=(
  53d1c1380c1b264eaadb7916b5864374
  041cde32c5ded7eb6a6512024951eb09
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package ()
{
  cd "$srcdir/$pkgname-$pkgver"
  python3 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}


# vim: set ts=2 sw=2 et:
