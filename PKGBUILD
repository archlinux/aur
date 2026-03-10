# Maintainer: Parham Alvani <parham.alvani@gmail.com>

pkgname=gosimac-bin
pkgver=5.6.1
pkgrel=1
pkgdesc="Fetch the wallpaper from Bings, Unsplash..."
arch=(x86_64)
url="https://github.com/1995parham/gosimac"
license=('GPL2')

conflicts=('gosimac' 'gosimac-git')
provides=('gosimac')

source=("https://github.com/1995parham/gosimac/releases/download/v${pkgver}/gosimac_${pkgver}_linux_amd64.tar.gz")

sha256sums=('f58ae7d38b385793474eaa6d9b25b9f35b84bc1959d953de72c7c8a2f80245f1')

package() {
  # package
  install -D -m755 $srcdir/gosimac $pkgdir/usr/bin/gosimac
}
