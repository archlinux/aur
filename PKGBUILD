# Maintainer: Tyler Veness <calcmogul at gmail dot com>

pkgname=sleipnirgroup-choreo
pkgver=2024.1.2
pkgrel=1
pkgdesc="A graphical tool for planning time-optimized trajectories for autonomous mobile robots in the FIRST Robotics Competition"
arch=('x86_64')
url='https://github.com/SleipnirGroup/Choreo'
depends=('webkit2gtk')
license=('BSD')
source=("https://github.com/SleipnirGroup/Choreo/releases/download/v2024.1.2-b/Choreo-v$pkgver-Linux-x86_64.deb")
md5sums=('f8bdc4dc21b6ef44c714c983bc846c26')

package() {
  tar -C "$pkgdir" -xf "$srcdir/data.tar.gz"
}
