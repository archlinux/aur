# Maintainer: Zhanibek Adilbekov <zhnaibek.adilbekov@proton.me>
# shellcheck disable=2034,2154,2164
pkgname=audio-share-bin
pkgver=0.0.17
pkgrel=1
pkgdesc="Audio Share can share computer's audio to Android phone over network, so your phone becomes the speaker of computer"
arch=('x86_64')
url='https://github.com/mkckr0/audio-share'
license=('Apache-2.0')
depends=('libpipewire')
source=("https://github.com/mkckr0/audio-share/releases/download/v${pkgver}/audio-share-server-cmd-linux.tar.gz")
b2sums=('3b2a87b650c36863fe6e8c3655770e77d1405440ba90c008d06ec460992b73b0d7b82d25647f1fb3607af9a65174bfb430d03ae765b8be5438cebff9b88f8879')

package() {
    install -Dm755 "$srcdir/audio-share-server-cmd/bin/as-cmd" "$pkgdir/usr/bin/as-cmd"
}
