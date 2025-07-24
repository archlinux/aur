# Maintainer:
# Contributor: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Crestwave <crest.wave@yahoo.com>
# Contributor: unrealapex <unrealapex@proton.me>

pkgname=fff
pkgver=2.2
pkgrel=7
pkgdesc='Simple and fast file manager'
arch=(any)
url='https://github.com/dylanaraps/fff'
license=(MIT)
makedepends=(git)
depends=(coreutils xdg-utils)
optdepends=('fbset: image display'
            'w3m: image display'
            'xdotool: image display')
source=("git+$url#tag=$pkgver")
b2sums=('e9a162f04aa0d1acb70f05121af309e28de49238cdb3f10b628ee8f2d86ff458c111f889a296fc1c412f975bb5934d8294d8330434035141eb0db18267df08df')

package() {
  cd $pkgname
  install -Dm755 -t "$pkgdir/usr/bin" $pkgname
  install -Dm644 -t "$pkgdir/usr/share/man/man1" $pkgname.1
  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.md
}
