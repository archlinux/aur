# Maintainer: Luís Ferreira <contact@lsferreira.net>
# Contributor: Andrew Walls <andrew.walls2 (at) gmail.com>
# Contributor: Aoibhinn Nic Aoidh <oibind@pm.me>

pkgname=sconsify
pkgver=0.6.0
pkgrel=1
pkgdesc="CLI Spotify client"
arch=('x86_64')
url="http://www.sconsify.org"
license=('Apache')
depends=('portaudio' 'libspotify')
source=("https://github.com/fabiofalci/sconsify/releases/download/next-20180428/linux-x86_64-sconsify-$pkgver-next.zip")
sha256sums=('46d628b19534b6e74eb450bda736b80321c2865edc230ff2df972a394bffc835')

package() {
    install -Dm755 sconsify "$pkgdir"/usr/bin/sconsify
}
