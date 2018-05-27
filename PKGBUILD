# Maintainer: Aviel Warschawski <mail@aviel.org>

pkgname=kplugs-dkms
pkgver=3.3.3
pkgrel=1
pkgdesc='KPlugs kernel module sources (DKMS)'
arch=('i686' 'x86_64')
url='http://www.kplugs.org/'
license=(GPL3)
depends=('dkms')
optdepends=('linux-headers: Build the module for Arch kernel')
source=("https://github.com/avielw/kplugs/archive/$pkgver.tar.gz")
sha256sums=("d1c61dc4388d94b0bec0264571765c9ec38f969381c99ee472d6bdb11e24db88")

package() {
  mkdir -p "$pkgdir"/usr/src
  cp -r "$srcdir"/kplugs-"$pkgver" "$pkgdir"/usr/src/kplugs-"$pkgver"
}

