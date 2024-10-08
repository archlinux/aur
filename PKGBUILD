# Maintainer: Jay Tauron <jytrn@protonmail.com>

pkgname=discord-rpc-extension-no-tray-bin
pkgver=0.3.0
pkgrel=1
pkgdesc="Discord rich presence extension with open API. No tray."
arch=('x86_64')
url="https://github.com/lolamtisch/Discord-RPC-Extension"
license=('GPL3')
provides=(discord-rpc-extension)
conflicts=(discord-rpc-extension-bin discord-rpc-extension-git discord-rpc-extension-no-tray-git)
source=("${pkgname}-${pkgver}.zip::${url}/releases/download/${pkgver}/linux_no_tray.zip")
sha256sums=('dbfbcc3123564d3f51d59cc0b885a04d79db5d5404efff397b66d3622a81279d')
options=(!strip)

package() {
  install -Dm755 "$srcdir/server_linux_no_tray_debug" "$pkgdir/usr/bin/discord-rpc-extension"
}

