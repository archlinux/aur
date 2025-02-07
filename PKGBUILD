# Maintainer: Tyler Veness <calcmogul at gmail dot com>

pkgname=sleipnirgroup-choreo
pkgver=2025.0.3
pkgrel=1
pkgdesc="A graphical tool for planning time-optimized trajectories for autonomous mobile robots in the FIRST Robotics Competition"
arch=('x86_64')
url='https://github.com/SleipnirGroup/Choreo'
depends=('webkit2gtk')
license=('BSD')
source=("https://github.com/SleipnirGroup/Choreo/releases/download/v${pkgver}/Choreo-v${pkgver}-Linux-x86_64.deb")
md5sums=('9ccab6c0f5eaff45d213ca495293764a')

package() {
  tar -C "$pkgdir" -xf "$srcdir/data.tar.gz"
}
