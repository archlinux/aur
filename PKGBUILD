pkgname=arch-os-manager
pkgver=1.8.9
pkgrel=2
pkgdesc="Arch OS System Manager"
arch=('any')
url="https://github.com/murkl/arch-os-manager"
license=('Apache-2.0')
depends=('base-devel' 'pacman-contrib')
optdepends=(
	'ttf-firacode-nerd: Install and set font icons that are used to display information'
	'libnotify: Add notification support'
	'paru: Add support for AUR packages'
	'flatpak: Add support for Flatpak packages'
	'xdg-utils: Add support for open news in browser'
	'reflector: Add support for refresh mirrorlist'
	'meld: Add support for merge pacdiff configurations'
	'downgrade: Add support for donwgrade system packages'
)
source=("https://github.com/murkl/arch-os-manager/releases/download/$pkgver/arch-os" "arch-os.desktop")
sha256sums=('ab97c205f862a980c795367990458af35cd83573abf74e9d747752e92f998a0e' 'SKIP')

package() {
	install -Dm755 "$srcdir/arch-os" "$pkgdir/usr/bin/arch-os"
	install -Dm644 "$srcdir/arch-os.desktop" "$pkgdir/usr/share/applications/arch-os.desktop"
}
