#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=xac
pkgver=2016.7
pkgrel=1
pkgdesc='A markdown- and Pandoc-based content management system (CMS).'
arch=(any)
license=(GPL)
url="http://xyne.archlinux.ca/projects/xac"
depends=(haskell-pandoc python3)
optdepends=('graphviz: plugin support' 'openbabel: plugin support' 'source-highlight: plugin support' 'tex2png: plugin support')
source=(
  http://xyne.archlinux.ca/projects/xac/src/xac-2016.7.tar.xz
  http://xyne.archlinux.ca/projects/xac/src/xac-2016.7.tar.xz.sig
)
sha512sums=(
  f31c58296d7f42dd49ab0a8ed95517480565df8d27692153125e70a7f0e552a2dc8ed9705f8167d758d68c5bb364e0c7e89a2d9685b3e69c3dd5d5b4aa9778e3
  1b0b0ffd48b160bf2c500f8e8a209e997ef102d0d627f9d2966744a8daa93174b6e85e2dbae8b4269783dad9ce6c08f196aa3b1e23e28ceb0f114d9c5335902a
)
md5sums=(
  57c7fd3ba2fe3474658065ca161a2497
  c677df01e6e6ec047237e47fcfaff43e
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package ()
{
  cd "$srcdir/$pkgname-$pkgver"
  python3 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}


# vim: set ts=2 sw=2 et:
