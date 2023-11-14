# Maintainer: NullCube <nullcub3 at gmail dot com>
pkgname=vencord-installer-cli-bin
pkgdesc="A CLI Installer for Vencord, the cutest Discord client mod"
pkgrel=1
pkgver=1.3.1
url="https://github.com/Vencord/Installer"
license=('GPL3')
arch=('x86_64')
provides=("vencord-installer-cli")
source=("https://github.com/Vencord/Installer/releases/download/v$pkgver/VencordInstallerCli-linux")
sha256sums=('dfdc9e9fa0cfdefec3c030146e9433098728de83f6922bf97f7c96e9ec78c472')

package() {
	mv VencordInstallerCli-linux vencordinstallercli
	install -Dm755 vencordinstallercli -t "$pkgdir/usr/bin"
}
