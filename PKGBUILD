# Maintainer: Aviel Warschawski <mail@aviel.org>

pkgname=kplugs-dkms
pkgver=3.3.4
pkgrel=1
pkgdesc='KPlugs kernel module sources (DKMS)'
arch=('i686' 'x86_64')
url='http://www.kplugs.org/'
license=(GPL3)
depends=('dkms')
optdepends=('linux-headers: Build the module for Arch kernel')
source=("https://github.com/avielw/kplugs/archive/$pkgver.tar.gz")
sha256sums=("ad516b037d0ac93849efe71d3f4ea521750651321737097453cb6fd392569a8f")

package() {
  mkdir -p "$pkgdir"/usr/src
  cp -r "$srcdir"/kplugs-"$pkgver" "$pkgdir"/usr/src/kplugs-"$pkgver"
}

