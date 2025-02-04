# Maintainer: Tyler Veness <calcmogul at gmail dot com>

pkgname=sleipnirgroup-choreo
pkgver=2025.0.2
pkgrel=1
pkgdesc="A graphical tool for planning time-optimized trajectories for autonomous mobile robots in the FIRST Robotics Competition"
arch=('x86_64')
url='https://github.com/SleipnirGroup/Choreo'
depends=('webkit2gtk')
license=('BSD')
source=("https://github.com/SleipnirGroup/Choreo/releases/download/v2025.0.2/Choreo-v2025.0.2-Linux-x86_64.deb")
md5sums=('bc383414910c4a8c3fb3cfb37d7878f2')

package() {
  tar -C "$pkgdir" -xf "$srcdir/data.tar.gz"
}
