# Maintainer: Tenshii <tenshii@miwa.lol>
pkgname=deezer-discord-rpc-bin
pkgver=1.3.10
pkgrel=1
pkgdesc="A Discord RPC for Deezer"
arch=('x86_64')
url="https://github.com/CuteTenshii/deezer-discord-rpc"
license=('MIT')
depends=('gtk3' 'nss' 'alsa-lib' 'mesa' 'xdg-utils')
source=("https://github.com/CuteTenshii/deezer-discord-rpc/releases/latest/download/DeezerDiscordRPC-linux-amd64.deb")
md5sums=("483e858097a65398a3fc4da00b627b31")
sha256sums=("de03e2f5e33d8c472dc8c6f5a3cddc95411f3a5b533cee5664c47b32c0bf0d52")

package() {
    # Extract the .deb file
    bsdtar -xf "DeezerDiscordRPC-linux-amd64.deb" -C "$srcdir"

    # Extract the data tarball
    bsdtar -xf "$srcdir/data.tar.xz" -C "$pkgdir"
}