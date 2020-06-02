# Maintainer: David < david at rjamo dot dev >
# Contributor: Tom < reztho at archlinux dot us >
pkgname=dnieremote
pkgver=1.0.0
pkgrel=1
pkgdesc="dnieremote"
arch=('x86_64')
url="https://www.dnielectronico.es/"
depends=('gtkmm3')
license=('custom')
DLAGENTS=('https::/usr/bin/curl -A "Mozilla/5.0" -fLC - --retry 3 --retry-delay 3 -o %o %u')
source=("https://www.dnielectronico.es/descargas/Apps/DNIeRemoteSetup_1.0-0_amd64.deb")

package() {
  cd "${srcdir}/"
  tar -xJf data.tar.xz
  mv usr "${pkgdir}/"
}

md5sums=('469294eed8f9f137f1b91816b882baf6')
