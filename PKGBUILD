# Maintainer: Tyler Veness <calcmogul at gmail dot com>

pkgname=sleipnirgroup-choreo
pkgver=2024.1.3
pkgrel=1
pkgdesc="A graphical tool for planning time-optimized trajectories for autonomous mobile robots in the FIRST Robotics Competition"
arch=('x86_64')
url='https://github.com/SleipnirGroup/Choreo'
depends=('webkit2gtk')
license=('BSD')
source=("https://github.com/SleipnirGroup/Choreo/releases/download/v$pkgver/Choreo-v$pkgver-Linux-x86_64.deb")
md5sums=('fba0defc3116dadaea2b5b0f40b73ba2')

package() {
  tar -C "$pkgdir" -xf "$srcdir/data.tar.gz"
}
