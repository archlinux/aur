# Maintainer: NullCube <nullcub3 at gmail dot com>
pkgname=vencord-installer-cli-bin
pkgdesc="A CLI Installer for Vencord, the cutest Discord client mod"
pkgrel=3
pkgver=1.4.0
url="https://github.com/Vencord/Installer"
license=('GPL3')
arch=('x86_64')
provides=("vencord-installer-cli")
source=("https://github.com/Vencord/Installer/releases/download/v$pkgver/VencordInstallerCli-linux")
sha256sums=('815917a79391a4426022b395cc1d8e41ae80130edab98cbfbe08fbbe67cd2b28')

package() {
	mv VencordInstallerCli-linux vencordinstallercli
	install -Dm755 vencordinstallercli -t "$pkgdir/usr/bin"
}
