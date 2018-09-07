# Maintainer: Oguz Bektas <xorond@gmail.com>

buildarch=1

pkgname=pentmenu
pkgver=1.7.2
pkgrel=1
groups=('archstrike' 'archstrike-misc')
arch=('any')
pkgdesc="Designed to be a simple way to implement various basic pentesting network functions, including network attacks, using wherever possible readily available software commonly installed on most linux distributions, without having to resort to multiple specialist tools"
url="https://github.com/GinjaChris/pentmenu"
license=('GPL3')
depends=('bash' 'hping' 'openbsd-netcat' 'openssl' 'stunnel' 'nmap' 'whois' 'ike-scan')
source=("https://github.com/GinjaChris/pentmenu/archive/${pkgver}.tar.gz")
sha512sums=('7ad8b03a3b7bf35632629723fc0ec7fccf61862ba37ca3bacac0285ae791b9e8f7029fbf05f0d5f7b109856c15a797dcd37c4dbbfb9b4f1fccf25f727725824b')

package() {
  cd ${pkgname}-${pkgver}
  install -dm755 "${pkgdir}/usr/bin"
  install -Dm755 pentmenu "${pkgdir}/usr/bin"
}
