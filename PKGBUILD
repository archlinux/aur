# Maintainer: Jake Barnes <me+aur@jakebarn.es>
pkgname=vivi
pkgver=2.13.2
pkgrel=1
pkgdesc="Client for Vivi, a wireless screen sharing solution"
arch=('x86_64')
url="http://vivi.io"
license=('unknown')
depends=('alsa-lib' 'gconf' 'gtk2' 'libxss' 'libxtst' 'nss' 'glib2' 'libpulse' 'libx11')
source=("https://downloads.vivi.io/app/${pkgver}/${pkgname}.deb")
md5sums=('0e03de6b905d93a5c35234f5890be4d6')

package() {
  msg2 "Extracting the data.tar.xz..."
  bsdtar -xf data.tar.xz -C "$pkgdir/"
}
