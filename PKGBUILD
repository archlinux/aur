# Maintainer: Zhanibek Adilbekov <zhnaibek.adilbekov@proton.me>
# shellcheck disable=2034,2154,2164
pkgname=audio-share-bin
pkgver=0.2.2
pkgrel=2
pkgdesc="Audio Share can share computer's audio to Android phone over network, so your phone becomes the speaker of computer"
arch=('x86_64')
url='https://github.com/mkckr0/audio-share'
license=('Apache-2.0')
depends=('libpipewire')
provides=('audio-share')
conflicts=('audio-share')
source=("$pkgname-$pkgver.tar.gz::https://github.com/mkckr0/audio-share/releases/download/v${pkgver}/audio-share-server-cmd-linux.tar.gz")
b2sums=('266a795fe36af77587f7f58081501cc62eba8d669326a31b05ffb7147f6deaf6c9b84e51a49b885f06e099f24f08d7f1af2f005618ee05b61ba1faecd1b8d698')

package() {
    install -Dm755 "$srcdir/audio-share-server-cmd/bin/as-cmd" "$pkgdir/usr/bin/as-cmd"
}
