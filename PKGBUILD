# Maintainer: Tenshii <tenshii@miwa.lol>
pkgname=deezer-discord-rpc-bin
pkgver=1.4.0
pkgrel=1
pkgdesc="A Discord RPC for Deezer"
arch=('x86_64')
url="https://github.com/CuteTenshii/deezer-discord-rpc"
license=('MIT')
depends=('gtk3' 'nss' 'alsa-lib' 'mesa' 'xdg-utils')
source=("https://github.com/CuteTenshii/deezer-discord-rpc/releases/latest/download/DeezerDiscordRPC-linux-amd64.deb")
md5sums=("7ce78547d79ab1e51cb44eae61f91237")
sha256sums=("60fdf9c009f9ec19611cf1281853d575fa3dfdbd60cd48ae838c380e70862d2a")

package() {
    # Extract the .deb file
    bsdtar -xf "DeezerDiscordRPC-linux-amd64.deb" -C "$srcdir"

    # Extract the data tarball
    bsdtar -xf "$srcdir/data.tar.xz" -C "$pkgdir"
}