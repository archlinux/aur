# Maintainer: NullCube <nullcub3 at gmail dot com>
pkgname=vencord-installer-cli-bin
pkgdesc="A CLI Installer for Vencord, the cutest Discord client mod"
pkgrel=2
pkgver=1.4.0
url="https://github.com/Vencord/Installer"
license=('GPL3')
arch=('x86_64')
provides=("vencord-installer-cli")
source=("https://github.com/Vencord/Installer/releases/download/v$pkgver/VencordInstallerCli-linux")
sha256sums=('a2c888f4e18445c6eb94c94f40d0b30937ffe22aeaeb2e9505382e9830f4acc8')

package() {
	mv VencordInstallerCli-linux vencordinstallercli
	install -Dm755 vencordinstallercli -t "$pkgdir/usr/bin"
}
