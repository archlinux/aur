# Maintainer: Jonathan Sanfilippo <jonalinux dot uk at gmail dot com>

pkgname=clean
pkgver=1.0
pkgrel=1
pkgdesc="System cleaner"
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/architalia/clean"
license=('GPL3')
depends=('bash' 'bc')  # Specifica le dipendenze del pacchetto, se ce ne sono

package() {
   install -Dm755 clean-detect -t "$pkgdir/usr/bin/"
}
