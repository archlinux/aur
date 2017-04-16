# Maintainer: Elvis Angelaccio <elvis.angelaccio@kde.org>
pkgname=guest-account
pkgver=2017.04.16
pkgrel=1
pkgdesc="tmpfiles.d configuration file to automatically remove /home/guest on shutdown"
arch=('any')
url="https://wiki.archlinux.org/index.php/Systemd#Temporary_files"
install="$pkgname.install"
source=("$pkgname.conf")
sha256sums=('be178b7975adcef75358e4865ae10f32653c067237df0129825aa7af5d149789')

package() {
  install -Dm644 "$pkgname.conf" "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"
}
