# Maintainer: Cauã Alvarenga Neves <cauaalvarenganeves@gmail.com>
# Upstream Developer: Mungai Njoroge <cwilvx (GitHub)>

pkgname=swingmusic-beta-bin
pkgver=2.0.0.beta13
pkgrel=1
pkgdesc="Swing Music is a beautiful, self-hosted music player for your local audio files. Like a cooler Spotify ... but bring your own music."
arch=('x86_64')
url="https://github.com/swingmx/swingmusic"
license=('MIT')
depends=()
conflicts=('swingmusic-bin' 'swingmusic')
source=("https://github.com/swingmx/swingmusic/releases/download/v$pkgver/swingmusic_linux_amd64")
md5sums=('SKIP')

package() {
    mv "$srcdir/swingmusic_linux_amd64" "$srcdir/swingmusic"
    install -Dm755 "$srcdir/swingmusic" "$pkgdir/usr/bin/swingmusic"
}
