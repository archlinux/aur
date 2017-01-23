# Maintainer: Andrew Walls <andrew.walls2 (at) gmail.com>
pkgname=sconsify
pkgver=0.3.0
pkgrel=1
pkgdesc="CLI Spotify client"
arch=('x86_64')
url="www.sconsify.org"
license=('Apache')
depends=('portaudio' 'libspotify')
source=("https://github.com/fabiofalci/sconsify/releases/download/v$pkgver/linux-x86_64-sconsify-$pkgver.zip")
sha256sums=('fb6510eaa85e8e9365d37847d57eaa01620fd5b61c690edaa2a76415695fa54a')

package() {
    install -Dm755 sconsify "$pkgdir"/usr/bin/sconsify
}
