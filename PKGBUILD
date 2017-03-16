# Maintainer: Bruno Silva <brunofernandes at ua dot pt>

pkgname=aaronia-mcs
pkgver=2.1.5
pkgrel=1
pkgdesc="Aaronia AG - MCS Spectrum Analyzer Software."
url=http://www.aaronia.de
arch=(x86_64)
license=(GPL)
depends=('qt5-base'  'qt5-multimedia')
provides=(aaronia-mcs)
conflicts=(aaronia-mcs)

source=(http://dev.aaronia-shop.com/downloads/v4/software/linux/deb64/aaronia-mcs.2.1.5-$CARCH.deb)

sha512sums=('18556640fc0e65be417e7730320754cf37f54450042b8cd85ba11d49bd6a0e5cda1a3d37f2e1aced435a22cc14dee49e30565870bcf79d5a84d2fb93a2568a0f')

package() {
  tar -xf data.tar.?z -C "$pkgdir" ./opt
  rm -rf $pkgdir/opt/aaronia
	chmod 755 $pkgdir/opt
}

