# Maintainer: mrAppleXZ <mr.applexz@gmail.com>

pkgname=ceserver
pkgver=6.5
pkgrel=1
pkgdesc='Cheat Engine Server.'
url='https://github.com/cheat-engine/cheat-engine/tree/master/Cheat%20Engine/ceserver'
arch=('x86_64')
license=('custom')
depends=('glibc' 'zlib')
makedepends=()
source=('https://www.cheatengine.org/download/ceserver_linux_x86_64.zip' 'ceserver.service')
sha512sums=(
  'e49a9ca71faaf6bce4fcc53df7d0d656b2ebe94e212e04e7ef4b099ca2f61f8220e406968cd22148e4d3648b9cd4cc33778e32fa4ae27d73666fceba4b743c3d'
  'd6506711f3ab8eab9e7352a3d7d1c52cd144e51d20ea4d48609efb28722c23f6128877604e502eb32de8ab2dcacc2526c0404efcbe812818317ad2c7b00f1467')

package() {
  install -Dm 755 "${srcdir}/ceserver" "${pkgdir}/usr/bin/ceserver"
  install -Dm 755 "${srcdir}/libceserver-extension.so" "${pkgdir}/usr/lib/libceserver-extension.so"
  install -Dm 644 "${srcdir}/ceserver.service" "${pkgdir}/usr/lib/systemd/system/ceserver.service"
}