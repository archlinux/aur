# Maintainer: Aviel Warschawski <mail@aviel.org>

pkgname=kplugs-dkms
pkgver=3.3
pkgrel=1
pkgdesc='KPlugs kernel module sources (DKMS)'
arch=('i686' 'x86_64')
url='http://www.kplugs.org/'
license=(GPL3)
depends=('dkms')
optdepends=('linux-headers: Build the module for Arch kernel')
source=("https://github.com/avielw/kplugs/archive/$pkgver.tar.gz")
sha256sums=("1153c59fd4f76b7767530411918719fdd357158f979d16c3d5a2b7e151bcfb25")

package() {
  mkdir -p "$pkgdir"/usr/src
  cp -r "$srcdir"/kplugs-"$pkgver" "$pkgdir"/usr/src/kplugs-"$pkgver"
}

