# Maintainer: Tyler Veness <calcmogul at gmail dot com>

pkgname=sleipnirgroup-choreo
pkgver=0.1.0
pkgrel=2
pkgdesc="A graphical tool for planning time-optimized trajectories for autonomous mobile robots in the FIRST Robotics Competition"
arch=('x86_64')
url='https://github.com/SleipnirGroup/Choreo'
depends=('webkit2gtk')
license=('BSD')
source=('https://github.com/SleipnirGroup/Choreo/releases/download/v0.1.0/Choreo-v0.1.0-Linux-x86_64.deb')
md5sums=('77ff9dbd863f6ecad493eeda652aa1d9')

package() {
  tar -C "$pkgdir" -xf "$srcdir/data.tar.gz"
}
