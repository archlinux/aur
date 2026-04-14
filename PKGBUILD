# Maintainer: Tyler Veness <calcmogul at gmail dot com>

pkgname=sleipnirgroup-choreo-bin
pkgver=2026.0.3
pkgrel=1
pkgdesc="A graphical tool for planning time-optimized trajectories for autonomous mobile robots in the FIRST Robotics Competition"
arch=('x86_64')
url='https://github.com/SleipnirGroup/Choreo'
depends=('webkit2gtk-4.1')
license=('BSD')
provides=('sleipnirgroup-choreo')
conflicts=('sleipnirgroup-choreo')
source=("https://github.com/SleipnirGroup/Choreo/releases/download/v${pkgver}/Choreo-v${pkgver}-Linux-x86_64.deb")
sha256sums=('5f2be33e9c0956c7ba5e7e6e892ed97bd09bdc4c3c4e9f8f36570e125160f58f')

package() {
  ar x Choreo-v${pkgver}-Linux-x86_64.deb data.tar.gz
  tar -C "$pkgdir" -xf data.tar.gz
}
