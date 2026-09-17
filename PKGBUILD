# Maintainer: NullCube <nullcub3 at gmail dot com>
pkgname=vencord-installer-cli-bin
pkgdesc="A CLI Installer for Vencord, the cutest Discord client mod"
pkgrel=1
pkgver=1.4.1
url="https://github.com/Vencord/Installer"
license=('GPL3')
arch=('x86_64')
provides=("vencord-installer-cli")
source=("https://github.com/Vencord/Installer/releases/download/v$pkgver/VencordInstallerCli-linux")
sha256sums=('530e069c1d19972587e4ca26fc85c414bfa6b100b6f6c9b7a0d2339d69ec58a8')

package() {
  mv VencordInstallerCli-linux vencordinstallercli
  install -Dm755 vencordinstallercli -t "$pkgdir/usr/bin"
}
