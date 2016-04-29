# Maintainer: Andy Crowd <andy_crowd@ainsdata.se>
pkgname=wipe-safe-at
pkgver=1.0.0
pkgrel=0
pkgdesc="Wipe safe - Avoid Typo."
arch=(any)
source=("wiper-safe-at::git+https://github.com/AndyCrowd/safe-disk-wiper.git")
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

