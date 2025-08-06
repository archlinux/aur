# Maintainer: Tyler Veness <calcmogul at gmail dot com>

pkgname=sleipnirgroup-choreo-bin
pkgver=2025.0.3
pkgrel=1
pkgdesc="A graphical tool for planning time-optimized trajectories for autonomous mobile robots in the FIRST Robotics Competition"
arch=('x86_64')
url='https://github.com/SleipnirGroup/Choreo'
depends=('webkit2gtk')
license=('BSD')
provides=('sleipnirgroup-choreo')
conflicts=('sleipnirgroup-choreo')
source=("https://github.com/SleipnirGroup/Choreo/releases/download/v${pkgver}/Choreo-v${pkgver}-Linux-x86_64.deb")
sha256sums=('3773885a4c0156f5e848daa79234f9df97821eeddc7831c6712e2c275069e4cd')

package() {
  ar x Choreo-v${pkgver}-Linux-x86_64.deb data.tar.gz
  tar -C "$pkgdir" -xf data.tar.gz
}
