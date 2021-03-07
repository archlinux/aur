# Maintainer: Jay Tauron <jytrn@protonmail.com>
pkgname=discord-rpc-extension-no-tray-bin
pkgver=0.1.2
pkgrel=1
epoch=
pkgdesc="Discord rich presence extension with open API. No tray."
arch=('x86_64')
url="https://github.com/lolamtisch/Discord-RPC-Extension"
license=('GPL3')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=('discord-rpc-extension')
conflicts=('discord-rpc-extension-bin' 'discord-rpc-extension-git' 'discord-rpc-extension-no-tray-git')
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/lolamtisch/Discord-RPC-Extension/releases/download/$pkgver/linux_no_tray.zip")
noextract=()
md5sums=('ba0fc2de6b212bc7a0ec15140869d035')
validpgpkeys=()

package() {
	install -Dm755 "$srcdir/server_linux_no_tray_debug" "$pkgdir/usr/bin/discord-rpc-extension"
}

