# Maintainer: Jay Tauron <jytrn@protonmail.com>

pkgname=discord-rpc-extension-bin
pkgver=0.3.0
pkgrel=1
pkgdesc="Discord rich presence extension with open API."
arch=('x86_64')
url="https://github.com/lolamtisch/Discord-RPC-Extension"
license=('GPL3')
provides=('discord-rpc-extension')
conflicts=('discord-rpc-extension-git' 'discord-rpc-extension-no-tray-bin' 'discord-rpc-extension-no-tray-git')
source=("${pkgname}-${pkgver}.zip::${url}/releases/download/${pkgver}/linux.zip")
sha256sums=('8a637b65be65a62d56c5fdc9b0613e70003a2413a9873316c54623309ab64f08')
options=(!strip)

package() {
	install -Dm755 "$srcdir/server_linux_debug" "$pkgdir/usr/bin/discord-rpc-extension"
}

