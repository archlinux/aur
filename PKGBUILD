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
sha256sums=('642ef250cc3008ffc8310d5e941ffd801837683980749ff1f24edf4b3b103b2a')

package() {
  tar xvf data.tar.xz -C "${pkgdir}/"
  chmod -R 755 ${pkgdir}/
}
