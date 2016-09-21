# Maintainer: Jeremy Ruten <jeremy.ruten@gmail.com>
# Contributor: Brad Conte <brad@bradconte.com>
# Ex-community Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
pkgname=stopwatch
pkgver=3.5
pkgrel=7
pkgdesc="virtual stopwatch"
arch=(any)
url="http://code.google.com/p/archlinux-stuff/downloads/list"
license=("Public Domain")
groups=()
depends=('tk')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
#install=
#changelog=
source=("https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/archlinux-stuff/stopwatch-$pkgver.tar.gz")
sha512sums=('f22cbd8e16d7d24c4b32191c5eb413e65d49207aaf6917eb3748e7aa55091b2f7ff8b03ab7954e1ee96a775c72443e6dfd5834311e5933a303f4e16b4c299ef2')

#prepare() {
#}

#build() {
#}

#check() {
#}

package() {
  mkdir -p $pkgdir/usr/bin
  cp $srcdir/$pkgname-3.4/stopwatch $pkgdir/usr/bin
  sed -e "s_/depot/path/wish_/usr/bin/wish_" -i $pkgdir/usr/bin/stopwatch
}

