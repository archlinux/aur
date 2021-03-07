# Maintainer: Jay Tauron <jytrn@protonmail.com>

pkgname=discord-rpc-extension-no-tray-bin
pkgver=0.1.2
pkgrel=1
pkgdesc="Discord rich presence extension with open API. No tray."
arch=('x86_64')
url="https://github.com/lolamtisch/Discord-RPC-Extension"
license=('GPL3')
provides=(discord-rpc-extension)
conflicts=(discord-rpc-extension-bin discord-rpc-extension-git discord-rpc-extension-no-tray-git)
source=("${pkgname}-${pkgver}.zip::${url}/releases/download/${pkgver}/linux_no_tray.zip")
sha256sums=('440ddc7545f1075af63c08115495d5c39c01611172af0455f8f0c9537e300ccd')
options=(!strip)

package() {
  install -Dm755 "$srcdir/server_linux_no_tray_debug" "$pkgdir/usr/bin/discord-rpc-extension"
}

