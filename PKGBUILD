# Maintainer: Zhanibek Adilbekov <zhnaibek.adilbekov@proton.me>
# shellcheck disable=2034,2154,2164
pkgname=audio-share-bin
pkgver=0.0.11
pkgrel=1
pkgdesc="Audio Share can share computer's audio to Android phone over network, so your phone becomes the speaker of computer"
arch=('x86_64')
url='https://github.com/mkckr0/audio-share'
license=('Apache')
source=("https://github.com/mkckr0/audio-share/releases/download/v${pkgver}/audio-share-server-cmd-linux.tar.gz")
b2sums=('0eb6a9db25206de74cf178696b757e4037dd212f17acd6067f881d29642f7cba1f85ca00693816b9c2c389283a36c5fdb2bea68fc69d2365e1ff82f03f980dc4')

package() {
    install -Dm755 "$srcdir/audio-share-server-cmd/bin/as-cmd" "$pkgdir/usr/bin/as-cmd"
}
