# Maintainer: INhBQfUQO2eFzulN <281587887a at protonmail dot ch>

pkgname=spotiflyer
pkgver=3.6.1
pkgrel=1
pkgdesc="Kotlin Multiplatform Music Downloader, Supports Spotify / Gaana / Youtube Music / Jio Saavn / SoundCloud."
arch=('any')
url="https://github.com/Shabinder/SpotiFlyer"
license=('GPL')
conflicts=(spotiflyer-bin)
source=("$url/releases/download/v$pkgver/${pkgname}_$pkgver-1_amd64.deb")
sha256sums=("2cea7aedc1d099b726df6618814e2ac938a926bd8e56405bab342f3f59ecbf51")

package() {
	cd $srcdir
    tar -xf data.tar.xz -C $pkgdir
    install -Dm644 $pkgdir/opt/spotiflyer/lib/spotiflyer-SpotiFlyer.desktop $pkgdir/usr/share/applications/spotiflyer.desktop
    install -Dm644 $pkgdir/opt/spotiflyer/lib/SpotiFlyer.png $pkgdir/usr/share/pixmaps/spotiflyer.png
}
