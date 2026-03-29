# Maintainer: Gaugeforever

pkgname='iio-sensor-proxy-openrc'
pkgver=1.0.0
pkgrel=1
epoch=0
pkgdesc='OpenRC iio-proxy-sensor init script.'
arch=('any')
url='https://github.com/Gaugeforever/iio-sensor-proxy-openrc'
license=('GPL-3.0-or-later')
depends=('iio-sensor-proxy' 'openrc')
source=('git+https://codeberg.org/Gaugeforever/iio-sensor-proxy-openrc.git')

package_iio-sensor-proxy-openrc() {
  pkgdesc="OpenRC init script for iio-sensor-proxy."
  depends=('iio-sensor-proxy' 'openrc')

  install -D -v -m755 "${srcdir}/iio-sensor-proxy-openrc/iio-sensor-proxy" "${pkgdir}/etc/init.d/iio-sensor-proxy"
}

sha256sums=('SKIP')
