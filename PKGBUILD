# Maintainer: Zhanibek Adilbekov <zhnaibek.adilbekov@proton.me>
# shellcheck disable=2034,2154,2164
pkgname=audio-share-bin
pkgver=0.3.4
pkgrel=1
pkgdesc="Audio Share can share computer's audio to Android phone over network, so your phone becomes the speaker of computer"
arch=('x86_64')
url='https://github.com/mkckr0/audio-share'
license=('Apache-2.0')
depends=('libpipewire')
provides=('audio-share')
conflicts=('audio-share')
source=("$pkgname-$pkgver.tar.gz::https://github.com/mkckr0/audio-share/releases/download/v${pkgver}/audio-share-server-cmd-linux.tar.gz")
b2sums=('b2ee43eb07144419d1e1b25a635da2228ba24e43ab9647ffdfa2185f5d19c04035ec199c8aff1b5ad8f0417d169d75f2b3ca5555fe4be944f22b73a510a698fa')

package() {
    install -Dm755 "$srcdir/audio-share-server-cmd/bin/as-cmd" "$pkgdir/usr/bin/as-cmd"
}
