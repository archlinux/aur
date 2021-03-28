# Maintainer: Tobias Müller <mintuser17 at gmail dot com>

pkgname=mediapurge
pkgver=7.14
pkgrel=1
pkgdesc="Mediapurge is a media management system. "
arch=('x86_64')
url='http://www.peter-ebe.de/#'
license=("custom:${pkgname}")
depends=('ffmpeg'
         'gtk2')
source=("http://www.peter-ebe.de/ubuntu/repo/binary/mediapurge.deb")
sha256sums=('316cb7ca9a19e6349f5c60fca014a236682627e0907db6fbd913b4e8ecf14abc')

package() {
  tar xvf data.tar.xz -C "${pkgdir}/"
}
