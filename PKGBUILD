# Maintainer: Jay Tauron <jytrn@protonmail.com>

pkgname=discord-rpc-extension-bin
pkgver=0.1.2
pkgrel=1
pkgdesc="Discord rich presence extension with open API."
arch=('x86_64')
url="https://github.com/lolamtisch/Discord-RPC-Extension"
license=('GPL3')
provides=('discord-rpc-extension')
conflicts=('discord-rpc-extension-git' 'discord-rpc-extension-no-tray-bin' 'discord-rpc-extension-no-tray-git')
source=("${pkgname}-${pkgver}.zip::${url}/releases/download/${pkgver}/linux.zip")
sha256sums=('91db83b55d458c046a3157a6a61a38ed6529914f458f9e93b589034f01647c6b')
options=(!strip)

package() {
	install -Dm755 "$srcdir/server_linux_debug" "$pkgdir/usr/bin/discord-rpc-extension"
}

