# Maintainer: NullCube <nullcub3 at gmail dot com>
pkgname=vencord-installer-cli-bin
pkgdesc="A CLI Installer for Vencord, the cutest Discord client mod"
pkgrel=1
pkgver=1.4.0
url="https://github.com/Vencord/Installer"
license=('GPL3')
arch=('x86_64')
provides=("vencord-installer-cli")
source=("https://github.com/Vencord/Installer/releases/download/v$pkgver/VencordInstallerCli-linux")
sha256sums=('eb96d07a2072eb805351de11a26bb78e83f30122321e76ffed26466bd2d61a59')

package() {
	mv VencordInstallerCli-linux vencordinstallercli
	install -Dm755 vencordinstallercli -t "$pkgdir/usr/bin"
}
