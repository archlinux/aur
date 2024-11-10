# Maintainer: Zhanibek Adilbekov <zhnaibek.adilbekov@proton.me>
# shellcheck disable=2034,2154,2164
pkgname=audio-share-bin
pkgver=0.2.1
pkgrel=2
pkgdesc="Audio Share can share computer's audio to Android phone over network, so your phone becomes the speaker of computer"
arch=('x86_64')
url='https://github.com/mkckr0/audio-share'
license=('Apache-2.0')
depends=('libpipewire')
provides=('audio-share')
conflicts=('audio-share')
source=("$pkgname-$pkgver.tar.gz::https://github.com/mkckr0/audio-share/releases/download/v${pkgver}/audio-share-server-cmd-linux.tar.gz")
b2sums=('e9738ec404cf366b181f66b275e19dddaba575227f80912bfc3db49eb58fd43f568e3e5191b3a101298064186da8fe1b0d05bf163d210fbd667cbd8db9fb890f')

package() {
    install -Dm755 "$srcdir/audio-share-server-cmd/bin/as-cmd" "$pkgdir/usr/bin/as-cmd"
}
