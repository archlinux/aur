# Maintainer: Andrew Walls <andrew.walls2 (at) gmail.com>
pkgname=sconsify
pkgver=0.5.0
pkgrel=1
pkgdesc="CLI Spotify client"
arch=('x86_64')
url="http://www.sconsify.org"
license=('Apache')
depends=('portaudio' 'libspotify')
source=("https://github.com/fabiofalci/sconsify/releases/download/v$pkgver/linux-x86_64-sconsify-$pkgver.zip")
sha256sums=('331371f9369b1553f088c1ceace6ade7088b9269ede16c4ddf2820b35218af86')

package() {
    install -Dm755 sconsify "$pkgdir"/usr/bin/sconsify
}
