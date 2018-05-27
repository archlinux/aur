# Maintainer: Aviel Warschawski <mail@aviel.org>

pkgname=kplugs-dkms
pkgver=3.3.2
pkgrel=2
pkgdesc='KPlugs kernel module sources (DKMS)'
arch=('i686' 'x86_64')
url='http://www.kplugs.org/'
license=(GPL3)
depends=('dkms')
optdepends=('linux-headers: Build the module for Arch kernel')
source=("https://github.com/avielw/kplugs/archive/$pkgver.tar.gz")
sha256sums=("a07eee17a2db0875b3c6ebfbf174eda9f4faa59aa666828fe495072671cd44e9")

package() {
  mkdir -p "$pkgdir"/usr/src
  cp -r "$srcdir"/kplugs-"$pkgver" "$pkgdir"/usr/src/kplugs-"$pkgver"
}

