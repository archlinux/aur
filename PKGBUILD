# Maintainer: Boris Bera <bboris at rsoft dot ca>
pkgname=autotags
pkgver=0.2.0
pkgrel=1
pkgdesc="A little tool that watches your source code and generates ctags."
arch=('any')
url="https://github.com/beraboris/autotags"
license=('MIT')
groups=()
depends=(bash ctags inotify-tools)
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(
  "https://github.com/beraboris/autotags/archive/v$pkgver.tar.gz"
)
noextract=()
md5sums=('bd6453fd58e01815f68f27d298f0e6d5')

package() {
  install -D -m 755 "$srcdir/$pkgname-$pkgver/autotags" \
                    "$pkgdir/usr/bin/autotags"
  install -D -m644 "$srcdir/$pkgname-$pkgver/LICENSE" \
                   "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
