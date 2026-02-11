# Maintainer: Yuuto <notyuuto@outlook.com>
pkgname=deezer-discord-rpc-bin
pkgver=1.3.8
pkgrel=1
pkgdesc="A Discord RPC for Deezer"
arch=('x86_64')
url="https://github.com/JustYuuto/deezer-discord-rpc"
license=('MIT')
depends=('electron')
source=("https://github.com/JustYuuto/deezer-discord-rpc/releases/latest/download/DeezerDiscordRPC-linux-amd64.deb")
md5sums=("2f9d18f1c8395dfeccf87e78b5f996ed")

package() {
    # Extract the .deb file
    bsdtar -xf "DeezerDiscordRPC-linux-amd64.deb" -C "$srcdir"

    # Extract the data tarball
    bsdtar -xf "$srcdir/data.tar.xz" -C "$pkgdir"
}