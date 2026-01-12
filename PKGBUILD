# Maintainer: Tyler Veness <calcmogul at gmail dot com>

pkgname=sleipnirgroup-choreo-bin
pkgver=2026.0.1
pkgrel=1
pkgdesc="A graphical tool for planning time-optimized trajectories for autonomous mobile robots in the FIRST Robotics Competition"
arch=('x86_64')
url='https://github.com/SleipnirGroup/Choreo'
depends=('webkit2gtk-4.1')
license=('BSD')
provides=('sleipnirgroup-choreo')
conflicts=('sleipnirgroup-choreo')
source=("https://github.com/SleipnirGroup/Choreo/releases/download/v${pkgver}/Choreo-v${pkgver}-Linux-x86_64.deb")
sha256sums=('85078d7fc1d125bb1be4e00bd80f66c7684e0b30ed89ead132ba3935d0d5d0db')

package() {
  ar x Choreo-v${pkgver}-Linux-x86_64.deb data.tar.gz
  tar -C "$pkgdir" -xf data.tar.gz
}
