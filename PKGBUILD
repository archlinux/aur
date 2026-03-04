# Maintainer: Pili <me@ayopili.com>
pkgname=adb-wifi-scanner
pkgver=1.0.0
pkgrel=1
pkgdesc="Scans and connects to Android devices over ADB wireless debugging. The command is: adbw."
arch=('any')
url="https://github.com/Piliii/adb-wifi-scanner"  # optional but recommended
license=('MIT')
depends=('android-tools' 'nmap')
source=("adbw.sh")
sha256sums=('SKIP')

package() {
    install -Dm755 "$srcdir/adbw.sh" "$pkgdir/usr/bin/adbw"
}
