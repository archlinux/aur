# Maintainer: Andy Crowd <andy_crowd@ainsdata.se>
pkgname=wipe-safe-at
pkgver=1.0.0
pkgrel=0
pkgdesc="Wipe safe - Avoid Typo."
arch=(any)
#source=("https://downloads.sourceforge.net/project/lstv/lstv-0.0.1.tar.gz?r=&ts=1411909125&use_mirror=optimate")
source=("safe-disk-wiper::git+https://github.com/AndyCrowd/safe-disk-wiper.git")
makedepends=('git')
optdepends=(xz
pv)
license=('GPL')
md5sums=(SKIP)
url="https://github.com/AndyCrowd/safe-disk-wiper"

package() {
  install -d "$pkgdir/usr/bin"
  install -m755 "$srcdir/$pkgname/wipe-safe-at" "$pkgdir/usr/bin"
}

