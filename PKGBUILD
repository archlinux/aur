# Maintainer: Andrew Walls <andrew.walls2 (at) gmail.com>
pkgname=sconsify
pkgver=0.4.0
pkgrel=1
pkgdesc="CLI Spotify client"
arch=('x86_64')
url="http://www.sconsify.org"
license=('Apache')
depends=('portaudio' 'libspotify')
source=("https://github.com/fabiofalci/sconsify/releases/download/v$pkgver/linux-x86_64-sconsify-$pkgver.zip")
sha256sums=('11d512a5225eab3127f253efa5d0c5d923dde99607ef656e07db3819dbad28a7')

package() {
    install -Dm755 sconsify "$pkgdir"/usr/bin/sconsify
}
