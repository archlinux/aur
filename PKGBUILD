# Maintainer: Tyler Veness <calcmogul at gmail dot com>

pkgname=sleipnirgroup-choreo
pkgver=2025.0.0.beta.5
pkgrel=1
pkgdesc="A graphical tool for planning time-optimized trajectories for autonomous mobile robots in the FIRST Robotics Competition"
arch=('x86_64')
url='https://github.com/SleipnirGroup/Choreo'
depends=('webkit2gtk')
license=('BSD')
source=("https://github.com/SleipnirGroup/Choreo/releases/download/v2025.0.0-beta-5/Choreo-v2025.0.0-beta-5-Linux-x86_64.deb")
md5sums=('f888483ede92e6ac34d43f7c8f7366ae')

package() {
  tar -C "$pkgdir" -xf "$srcdir/data.tar.gz"
}
