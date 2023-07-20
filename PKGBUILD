# Maintainer: Tyler Veness <calcmogul at gmail dot com>

pkgname=sleipnirgroup-choreo
pkgver=0.0.0
pkgrel=1
pkgdesc="A graphical tool for planning time-optimized trajectories for autonomous mobile robots in the FIRST Robotics Competition"
arch=('x86_64')
url='https://github.com/SleipnirGroup/Choreo'
license=('BSD')
source=('https://github.com/SleipnirGroup/Choreo/releases/download/untagged-2c6b0b46e4c4b78bd67d/Choreo-v0.0.0-Linux-x86_64.deb')
md5sums=('3fb1342013e4f20fc1407de4eb6c81e3')

package() {
  tar -C "$pkgdir" -xf "$srcdir/data.tar.gz"
}
