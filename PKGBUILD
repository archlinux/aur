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
sha256sums=('4bc0cdff35f5d7e1aca60364d22b609add7a08e532e0a0bad4db6ace282dd528')

package() {
  tar xvf data.tar.xz -C "${pkgdir}/"
  chmod -R 755 ${pkgdir}/
}
