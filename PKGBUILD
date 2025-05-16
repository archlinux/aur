# Maintainer: waveplate <dissahc@pm.me>
pkgname=img2irc-bin
pkgver=1.3.1
pkgrel=1
pkgdesc="a highly versatile image to IRC/ANSI art converter (universal linux binary for x86_64)"
arch=('x86_64')
url="https://github.com/waveplate/img2irc"
license=('GPL3')
provides=('img2irc')
conflicts=('img2irc')
source=("https://github.com/waveplate/img2irc/releases/download/v$pkgver/img2irc-$pkgver-linux-x86_64.tar.gz")
sha256sums=('815722ed6543e6da90c8661203271c52f46822a48f237e95ffed2dfda889607b')

package() {
    cd "$srcdir"
    tar -xzf "img2irc-$pkgver-linux-x86_64.tar.gz"
    install -Dm755 "img2irc-$pkgver/img2irc" "$pkgdir/usr/bin/img2irc"
    install -Dm644 "img2irc-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
