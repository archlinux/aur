# Maintainer: Jay Tauron <jytrn@protonmail.com>
pkgname=discord-rpc-extension-bin
pkgver=0.1.2
pkgrel=1
epoch=
pkgdesc="Discord rich presence extension with open API."
arch=('x86_64')
url="https://github.com/lolamtisch/Discord-RPC-Extension"
license=('GPL3')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=('discord-rpc-extension')
conflicts=('discord-rpc-extension-git' 'discord-rpc-extension-no-tray-bin' 'discord-rpc-extension-no-tray-git')
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/lolamtisch/Discord-RPC-Extension/releases/download/$pkgver/linux.zip")
noextract=()
md5sums=('7fc7e8943ca7ab317d57b8b907e18b47')
validpgpkeys=()

package() {
	install -Dm755 "$srcdir/server_linux_debug" "$pkgdir/usr/bin/discord-rpc-extension"
}

