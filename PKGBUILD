# Maintainer: Tyler Veness <calcmogul at gmail dot com>

pkgname=sleipnirgroup-choreo
pkgver=2025.0.0.beta.3
pkgrel=1
pkgdesc="A graphical tool for planning time-optimized trajectories for autonomous mobile robots in the FIRST Robotics Competition"
arch=('x86_64')
url='https://github.com/SleipnirGroup/Choreo'
depends=('webkit2gtk')
license=('BSD')
source=("https://github.com/SleipnirGroup/Choreo/releases/download/v2025.0.0-beta-3/Choreo-v2025.0.0-beta-3-Linux-x86_64.deb")
md5sums=('82f6cc761ca7a490342bd71fa70a057b')

package() {
  tar -C "$pkgdir" -xf "$srcdir/data.tar.gz"
}
