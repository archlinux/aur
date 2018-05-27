# Maintainer: Aviel Warschawski <mail@aviel.org>

pkgname=kplugs-dkms
pkgver=3.3.2
pkgrel=1
pkgdesc='KPlugs kernel module sources (DKMS)'
arch=('i686' 'x86_64')
url='http://www.kplugs.org/'
license=(GPL3)
depends=('dkms')
optdepends=('linux-headers: Build the module for Arch kernel')
source=("https://github.com/avielw/kplugs/archive/$pkgver.tar.gz")
sha256sums=("ab4a624471e71a5d89fdaa4dbb1f00b8f4b633d61e631126fea6541bc999d206")

package() {
  mkdir -p "$pkgdir"/usr/src
  cp -r "$srcdir"/kplugs-"$pkgver" "$pkgdir"/usr/src/kplugs-"$pkgver"
}

