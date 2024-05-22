# Maintainer: Zhanibek Adilbekov <zhnaibek.adilbekov@proton.me>
# shellcheck disable=2034,2154,2164
pkgname=audio-share-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="Audio Share can share computer's audio to Android phone over network, so your phone becomes the speaker of computer"
arch=('x86_64')
url='https://github.com/mkckr0/audio-share'
license=('Apache-2.0')
depends=('libpipewire')
source=("https://github.com/mkckr0/audio-share/releases/download/v${pkgver}/audio-share-server-cmd-linux.tar.gz")
b2sums=('598f22db73b0c60373fd2022961b5d1be2917d0087d3060b15089067d4c6f792c9365fa0aacc8e3188a916f94a4df52adfea5a0c7095737fa15bff0c2445680d')

package() {
    install -Dm755 "$srcdir/audio-share-server-cmd/bin/as-cmd" "$pkgdir/usr/bin/as-cmd"
}
