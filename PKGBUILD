# Maintainer: NullCube <nullcub3 at gmail dot com>
pkgname=vencord-installer-cli-bin
pkgdesc="A CLI Installer for Vencord, the cutest Discord client mod"
pkgrel=1
pkgver=1.4.2
url="https://github.com/Vencord/Installer"
license=('GPL3')
arch=('x86_64')
provides=("vencord-installer-cli")
source=("https://github.com/Vencord/Installer/releases/download/v$pkgver/VencordInstallerCli-linux")
sha256sums=('52642c8521a866ad241c10337144a4f513672c54b9c86a8169954785054c815d')

package() {
  mv VencordInstallerCli-linux vencordinstallercli
  install -Dm755 vencordinstallercli -t "$pkgdir/usr/bin"
}
