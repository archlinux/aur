# Maintainer: Yuuto <notyuuto@outlook.com>
pkgname=deezer-discord-rpc-bin
pkgver=1.3.7
pkgrel=1
pkgdesc="A Discord RPC for Deezer"
arch=('x86_64')
url="https://github.com/JustYuuto/deezer-discord-rpc"
license=('MIT')
depends=('electron')
source=("https://github.com/JustYuuto/deezer-discord-rpc/releases/latest/download/DeezerDiscordRPC-linux-amd64.deb")
md5sums=("a358c92ad57ed3139e632d4191c61f05")

package() {
    # Extract the .deb file
    bsdtar -xf "DeezerDiscordRPC-linux-amd64.deb" -C "$srcdir"

    # Extract the data tarball
    bsdtar -xf "$srcdir/data.tar.xz" -C "$pkgdir"
}