# Maintainer: Lukas Waymann <io@meribold.org>

pkgname=elles-bin
pkgver=0.2.0
pkgrel=1
pkgdesc='A nicer /bin/ls'
arch=(x86_64)
url=https://github.com/arp242/elles
license=(MIT)
provides=(elles)
conflicts=(elles)

source=("https://github.com/arp242/elles/releases/download/v$pkgver/elles-v$pkgver-linux-amd64.gz"
        "https://raw.githubusercontent.com/arp242/elles/master/LICENSE")
sha256sums=(7a37af8bff95c6524cb105866fcd653a8bfbe32e5bf98cc51064213a16a22a70
            401b054d7378650e9289148ff085496190a301820c93eaacec84f1ae46cb2d22)

package() {
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -D "elles-v$pkgver-linux-amd64" "$pkgdir/usr/bin/elles"
}
